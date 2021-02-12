import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Helpers/Card_helper.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';
void main() => runApp(NotificationBody());
class NotificationBody extends StatefulWidget {
  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  List<Notifications> notifications = [
    Notifications(title: "Order Placed Successfully",subtitle: "Thu, Dec 24 10: 21: 33 GMT +05: 00 2020", description: "We have received your order(1128). You will be notified on each step pf your order processing or you can visit history to check status anytime in your app. Thanks, Team HealthSolutions\n"),
    Notifications(title: "Order Placed Successfully",subtitle: "Fri, Dec 24 10: 21: 33 GMT +05: 00 2020", description: "We have received your order(1238). You will be notified on each step pf your order processing or you can visit history to check status anytime in your app. Thanks, Team HealthSolutions\n"),
    Notifications(title: "Order Placed Successfully",subtitle: "Sat, Dec 24 10: 21: 33 GMT +05: 00 2020", description: "We have received your order(1348). You will be notified on each step pf your order processing or you can visit history to check status anytime in your app. Thanks, Team HealthSolutions\n"),
    Notifications(title: "Order Placed Successfully",subtitle: "Sun, Dec 24 10: 21: 33 GMT +05: 00 2020", description: "We have received your order(1458). You will be notified on each step pf your order processing or you can visit history to check status anytime in your app. Thanks, Team HealthSolutions\n")
  ];

  void showPopup() {
    showDialog(
      context: context,
      builder: (_) => PopUp(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Notifications",
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
          // scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: notifications.map((notification) {
                  // return Text('${quote.text} - ${quote.author}');
                  return NotificationCard(
                      notification: notification,
                      delete: (){
                        setState(() {
                          notifications.remove(notification);
                        });
                      },
                      view: (){
                        showPopup();
                      },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
    ),
    );
}
}

class PopUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopUpState();
}

class PopUpState extends State<PopUp> with TickerProviderStateMixin {
  AnimationController controller;
  double _bottom = 0, _fromTop = 100, _screenHeight, _containerHeight = 500;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this)
      ..addListener(() {
        Timer.periodic(Duration(milliseconds: 15), (timer) {
          if (_bottom < _screenHeight - _fromTop - _containerHeight) {
            _bottom += 1;
            setState(() {});
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: _bottom,
            left: 0,
            right: 0,
            child: Container(
                height: _containerHeight,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width*0.75,
                    // height: MediaQuery.of(context).size.height*0.35,
                    image: AssetImage('asset/Images/1.png'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width*0.75,
                    child: Text(
                      'Title',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none,
                        fontFamily: 'Family Name',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width*0.75,
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Order Placed Successfully',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Family Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width*0.75,
                    child: Text(
                      'Message',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none,
                        fontFamily: 'Family Name',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width*0.75,
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "In today's time, when Pizza delivery is guaranteed within 30 minutes, or you get an Uber within 5-7 minutes, it's misfortune that you cannot get life-saving medicines, blood or ambulance even in an hour or so. ",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Family Name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}