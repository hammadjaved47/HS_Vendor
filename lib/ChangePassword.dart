import 'package:flutter/material.dart';
import 'package:vendor_app/BottomNavBar.dart';
class ChangePasswordBody extends StatefulWidget {
  @override
  _ChangePasswordBodyState createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Change Password',
          ),
        ),
      ),

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
              Image(
                width: MediaQuery.of(context).size.width*0.80,
                // height: MediaQuery.of(context).size.height*0.35,
                image: AssetImage(
                  'asset/Images/Mobile_login.png',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 55,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black54)),
                      labelText: 'New Password',
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 55,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black54)),
                      labelText: 'Re-Type Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.55,
                height: 50,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarBody()));
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Update Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
