import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_app/Login_Page.dart';
class ForgotBody extends StatefulWidget {
  @override
  _ForgotBodyState createState() => _ForgotBodyState();
}

class _ForgotBodyState extends State<ForgotBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('asset/Images/background2.png'),
                scale: 1,
                fit: BoxFit.fill
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height*0.10,
              // ),
              Container(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Image(
                width: MediaQuery.of(context).size.width*0.70,
                // height: MediaQuery.of(context).size.height*0.35,
                image: AssetImage('asset/Images/password.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.80,
                height: 55,
                // margin: EdgeInsets.only(top: 5, bottom: 5),

                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurpleAccent,
                    primaryColorDark: Colors.deepPurpleAccent,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black54)),
                        labelText: 'Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width *0.50,
                height: 50,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: RaisedButton(
                    onPressed: (){
                      Fluttertoast.showToast(
                          msg: "New Password Sent At Your Email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.deepPurpleAccent,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Body()));
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Next',
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
