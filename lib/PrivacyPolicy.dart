import 'package:flutter/material.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/Terms&Condition.dart';

class PrivacyBody extends StatefulWidget {
  @override
  _PrivacyBodyState createState() => _PrivacyBodyState();
}

class _PrivacyBodyState extends State<PrivacyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Privacy Policy',
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
              Container(
                width: MediaQuery.of(context).size.width *0.95,
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "In today's time, when Pizza delivery is guaranteed within 30 minutes, or you get an Uber within 5-7 minutes, it's misfortune that you cannot get life-saving medicines, blood or ambulance even in an hour or so. ",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.95,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "HealthSolutions, an app, to support the humanity in such critical scenarios, has been launched voluntarily by Engitech. Our team will be delivering Healthcare and blood products and such other required items to your doorstep.",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.95,
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "HealthSolutions is a platform to merge the efforts of famous NGOs, blood banks, pharmaceutical resources and generous blood donors in order to assist people in need of blood, medicines or ambulance.",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

