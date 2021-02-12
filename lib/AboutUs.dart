import 'package:flutter/material.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';

class AboutBody extends StatefulWidget {
  @override
  _AboutBodyState createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'About Us',
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
                  width: MediaQuery.of(context).size.width*0.92,
                  // height: MediaQuery.of(context).size.height*0.35,
                  image: AssetImage('asset/Images/1.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                      'version: 2.11',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.90,
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                          "In today's time, when Pizza delivery is guaranteed within 30 minutes, or you get an Uber within 5-7 minutes, it's misfortune that you cannot get life-saving medicines, blood or ambulance even in an hour or so. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 19,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.90,
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        "HealthSolutions, an app, to support the humanity in such critical scenarios, has been launched voluntarily by Engitech. Our team will be delivering Healthcare and blood products and such other required items to your doorstep.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
        ),

    );
  }
}

