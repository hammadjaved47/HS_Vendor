  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  import 'package:vendor_app/Helpers/Modals/Card_Modal.dart';


  class NotificationCard extends StatelessWidget {

    final Notifications notification;
    final Function delete;
    final Function view;
    NotificationCard({this.notification,this.delete, this.view});


    @override
    Widget build(BuildContext context) {
      return Stack(
          children: [
             Card(
              child: Column(
                children: [
                  Container(
                    height: 25,
                    alignment: Alignment.topRight,
                    child: IconButton(
                      alignment: Alignment.topRight,
                      onPressed: delete,
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                      icon: Icon(
                        Icons.cancel,
                        size: 35,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [

                        ///------------Bell-----------
                        Container(
                          // color: Colors.grey,
                          // width: 60,
                          height: 60,
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(Icons.notifications, size: 30, color: Colors.orangeAccent,),
                        ),

                        ///--------Order Placed-------
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,
                          height: 60,
                          child: ListTile(
                            title: Text(
                              notification.title,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                  fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            subtitle: Text(
                              notification.subtitle,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [

                      ///------------Icon--------------
                      // Container(
                      //   width: 75,
                      //   height: 75,
                      //   child: Image.asset('images/icons.png', scale: 1.5,),
                      // ),

                      ///-----------Text---------------
                      Container(
                        width: MediaQuery.of(context).size.width*0.97,
                        height: 65,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          notification.description,
                          // 'We have received your order(1128). You will be notified on each step pf your order processing or you can visit history to check status anytime in your app. Thanks, Team HealthSolutions\n'
                        ),
                      ),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*1,
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: view,
                      child: Container(
                        width: 110,
                        height: 35,
                        // padding: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(Icons.remove_red_eye, color: Colors.white,),
                            ),

                            Container(
                              child: Text('  VIEW     ', style: TextStyle(color: Colors.white),),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
      );
    }
  }
