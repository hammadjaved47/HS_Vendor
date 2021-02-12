import 'package:flutter/material.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';

class ContactBody extends StatefulWidget {
  @override
  _ContactBodyState createState() => _ContactBodyState();
}

class _ContactBodyState extends State<ContactBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Contact Us',
          ),
        ),
      ),

      drawer: MyDrawer(),

      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/Images/background2.png"),
            scale: 1,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Image(
                width: MediaQuery.of(context).size.width*0.65,
                // height: MediaQuery.of(context).size.height*0.35,
                image: AssetImage('asset/Images/11.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                              'asset/Images/call_center_agent1.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35,),
                        child: Text(
                            'Call Us',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                                ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(

                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                            'asset/Images/call_center_agent2.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15,),
                        child: Text(
                          'Request A Call',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
