import 'package:flutter/material.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/AddProducts.dart';
import 'package:vendor_app/GetProducts.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/UpdateProduct.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';
class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.all(0),
        // scrollDirection: Axis.vertical,
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,

            ),
            accountName: Text(
              "Hammad",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              "hammadjaved47@gmail.com",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.grey,
                size: 73,
              ),
              backgroundColor: Colors.white,
            ),
            // onDetailsPressed: (){},
          ),

          //============Drawer_Header=============//
          // Container(
          //
          //   padding: EdgeInsets.only(top: 18),
          //   height: 10,
          //
          //   child: ListView(
          //     children: [
          //       // Padding(
          //       //   padding: const EdgeInsets.only(right: 200, top: 0),
          //       //   child: Image.asset(
          //       //
          //       //     'asset/Images/Logo.png',
          //       //     height: 91,
          //       //     width: MediaQuery.of(context).size.width*1,
          //       //   ),
          //       // ),
          //       // Padding(
          //       //   padding: const EdgeInsets.only(left: 12, top: 9),
          //       //   child: Text('Hammad',
          //       //     style: TextStyle( fontSize: 14.5, fontWeight: FontWeight.w400, color: Colors.black), ),
          //       // ),
          //     ],
          //   ),
          // ),
          // Divider(
          //   color: Colors.grey,
          // ),
          //==============List_View===============//

          ///===============1====================
          InkWell(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarBody()),
              );
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.mail),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text('Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///================2===================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.chat),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('Conatct Us', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============3====================
          InkWell(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.person),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('About Us', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutBody())
              );
            },
          ),
          ///===============4====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyBody())
              );
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 10),
                  child: Icon(Icons.card_travel,
                    color: Colors.grey[700],),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 12),
                  child: Text('Privacy Policy', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: Text(
              'Others',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
              ),
            ),
          ),
          ///===============**================
          InkWell(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddProducts()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.send),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text('Add Products', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///==================**************===================
          InkWell(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => GetProducts()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.send),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text('Get Products', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),///==================**************===================
          // InkWell(
          //
          //   onTap: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProductBody()));
          //   },
          //   child: Row(
          //     children: <Widget>[
          //       Padding(
          //         padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
          //         child: Icon(Icons.send),
          //       ),
          //       Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
          //         child: Text('Update Products', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
          //       ),
          //     ],
          //   ),
          // ),
          ///===============5====================
          InkWell(

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Body()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.send),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                  child: Text('Login', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============6====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.file_upload),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text("SignUp", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============7====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.image),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('Notifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============8====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConditionBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.restore_from_trash),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('Terms and Conditions', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============9====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WalletBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.chat),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('My Wallet', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============10====================
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountBody()));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.chat),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('My Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),
          ///===============11====================
          InkWell(
            onTap: (){},
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Icon(Icons.chat),
                ),
                Padding(padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                  child: Text('Contact Us', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
