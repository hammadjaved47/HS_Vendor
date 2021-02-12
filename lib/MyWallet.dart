import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';

class WalletBody extends StatefulWidget {
  @override
  _WalletBodyState createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "My Wallet",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15, right: 17, left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(
                      // width: MediaQuery.of(context).size.width*0.92,
                      // height: MediaQuery.of(context).size.height*0.35,
                      image: AssetImage('asset/Images/open-box.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                          'Reward Points: 0',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: Image(
                  // width: MediaQuery.of(context).size.width*1,
                  // height: MediaQuery.of(context).size.height*0.35,
                  image: AssetImage('asset/Images/wallet1.png'),

                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                child: Text(
                    'Available Wallet Points',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width*0.80,
                height: 55,
                margin: EdgeInsets.only(top: 10, bottom: 10, left: 35, right: 35),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(
                        0.5, // Move to right 10  horizontally
                        0.5, // Move to bottom 10 Vertically
                      ),
                      // soften the shadow
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
                          'asset/Images/wallet11.png',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5,),
                      child: Text(
                        '0',
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
              Container(
                margin: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Wallet Amount',
                style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.w400,
                ),
                    ),
                    Text(
                        'Rs.0.00',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                        '100Pts = Rs.1',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width*0.70,
                height: 55,
                margin: EdgeInsets.only(left: 55, right: 55),

                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.black54),
                        // ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black54)),
                        hintText: 'Enter Topup Amount',
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *1,
                height: 45,
                margin: const EdgeInsets.only(top: 20, bottom: 20, left: 90, right: 90),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *1,
                  child: RaisedButton(
                    onPressed: (){},
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      'Top Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
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
