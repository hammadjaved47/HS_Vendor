import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/UpdateProfile.dart';
import 'package:vendor_app/ChangePassword.dart';
void main() => runApp(MyAccountBody());

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAccountBody(),
    );
  }
}

class MyAccountBody extends StatefulWidget {
  @override
  _MyAccountBodyState createState() => _MyAccountBodyState();
}

class _MyAccountBodyState extends State<MyAccountBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "My Account",
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
                margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: FadeInImage.assetNetwork(
                    imageScale: 1,
                    width: 150,
                      placeholder: 'asset/Images/user.png',
                    image: 'https://example.com/image.jpg',

                  )
              ),
              Container(
                child: Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 50,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                ),
                child: Text(
                  'Hammad Javed',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 50,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                ),
                child: Text(
                  'hammadjaved47@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 50,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                ),
                child: Text(
                  '032022569874',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 50,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                ),
                child: Text(
                  'Pakistan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width*0.85,
              //   height: 40,
              //   alignment: Alignment.topLeft,
              //   child: FlatButton.icon(
              //     onPressed: (){},
              //     color: Colors.transparent,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(32),
              //     ),
              //     icon: Icon(
              //         Icons.add,
              //       size: 35,
              //       color: Colors.blue[900],
              //     ),
              //     label: Text(
              //         'Add Address',
              //       style: TextStyle(
              //         fontSize: 19,
              //         color: Colors.blue[900],
              //       ),
              //     ),
              //
              //   ),
              //
              // ),
              Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: 40,
                alignment: Alignment.topLeft,
                child: FlatButton.icon(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfileBody()));
                  },
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  icon: Icon(
                    Icons.add,
                    size: 35,
                    color: Colors.blue[900],
                  ),
                  label: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.blue[900],
                    ),
                  ),

                ),

              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.55,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordBody()));
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width*0.55,
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Body()));
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )

            ],
          ),
        ),
      ),
    );
  }
}
