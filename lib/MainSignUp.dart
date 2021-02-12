import 'package:flutter/material.dart';
import 'package:vendor_app/DoctorSignUp.dart';
import 'package:vendor_app/DriverSignUp.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(MainSignUp());

class MainSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SignUpBody(),
    );
  }
}
class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  List<String> _locations = ['SignUp as Doctor', 'SignUp as Driver']; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("asset/Images/background.jpeg"),
            scale: 1,
            fit: BoxFit.fill,

          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.16,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Sign-Up',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Image(
                width: MediaQuery.of(context).size.width*0.70,
                // height: MediaQuery.of(context).size.height*0.35,
                image: AssetImage('asset/Images/password.png'),
              ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.deepPurple[400]),
                borderRadius: BorderRadius.circular(20),
                ),
              child: DropdownButton(
                iconEnabledColor: Colors.deepPurple[400],
                iconSize: 35,
                dropdownColor: Colors.white,

          hint: Text(
              'Sign-Up As',
              style: new TextStyle(
                color: Colors.deepPurple[400],
              ),
          ), // Not necessary for Option 1
          value: _selectedLocation,
          onChanged: (newValue) {
              setState(() {
                _selectedLocation = newValue;
                // print(_selectedLocation);
              });
          },
          items: _locations.map((location) {
              return DropdownMenuItem(
                child: new Text(
                  location,
                style: TextStyle(
                  color: Colors.deepPurple[400],
                ),
                ),
                value: location,
              );
          }).toList(),
        ),
            ),
              Container(
                width: MediaQuery.of(context).size.width *0.30,
                height: 45,
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: RaisedButton(
                    onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                      if(_selectedLocation == "SignUp as Driver"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DriverSignUp()));
                      }
                      else if(_selectedLocation == "SignUp as Doctor"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorSignUpBody()));
                      }
                      else{

                        Fluttertoast.showToast(
                            msg: "Please select an option",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey[500],
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 18,
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
