import 'package:flutter/material.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/ProgressHUD.dart';
import 'package:vendor_app/ForgotPassword.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/Validator/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login_Body(),
    );
  }
}
class Login_Body extends StatefulWidget {
  @override
  _Login_BodyState createState() => _Login_BodyState();
}


class _Login_BodyState extends State<Login_Body> {

  @override

  void initState()
  {
    super.initState();
    this.checkLogin();
  }

  bool _isLoading = false;
  bool _isSignedIn = false;
  bool hidepassword = true;
  int _radioValue;
  String errorMessage='Unknown error please contact our team';

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController loginemail_controller = TextEditingController();
  final TextEditingController loginpassword_controller = TextEditingController();

  String validateLoginPassword(value) {
    if (value.length <= 0) {
      return 'Please enter your password';
    }
  }

  List<String> _locations = [
    'SignIn as Doctor',
    'SignIn as Driver'
  ]; // Option 2
  String _selectedLocation;

  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 1,
          width: MediaQuery
              .of(context)
              .size
              .width * 1,
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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.16,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'User Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Image(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.80,
                  // height: MediaQuery.of(context).size.height*0.35,
                  image: AssetImage(
                    'asset/Images/Mobile_login.png',

                  ),

                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.80,
                        height: 55,
                        // margin: EdgeInsets.only(top: 5, bottom: 5),

                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.deepPurpleAccent,
                            primaryColorDark: Colors.deepPurpleAccent,
                          ),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (validateLoginEmail(value) == false) {
                                return 'Please Enter a valid email address';
                              }
                              return null;
                            },

                            controller: loginemail_controller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.black54)),
                              labelText: 'Email Address',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.80,
                        height: 55,
                        margin: EdgeInsets.only(top: 8, bottom: 8),

                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.deepPurpleAccent,
                            primaryColorDark: Colors.deepPurpleAccent,
                          ),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: validateLoginPassword,
                            controller: loginpassword_controller,
                            obscureText: hidepassword,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidepassword = !hidepassword;
                                    });
                                  },
                                  icon: Icon(
                                    hidepassword ? Icons.visibility_off : Icons
                                        .visibility,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.black54)),
                                labelText: 'Password'
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.503,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        // margin: EdgeInsets.only(top: 5, bottom: 5),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButton(

                          iconEnabledColor: Colors.black54,
                          iconSize: 35,
                          hint: Text(
                            'Sign-In As',
                            style: new TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          // Not necessary for Option 1
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
                                  color: Colors.black,
                                ),
                              ),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.82,
                        // margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            ///----------------------Button 1
                            new Radio(
                              toggleable: true,
                              activeColor: Colors.deepPurpleAccent,
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChange,
                            ),
                            new Text(
                              'Remember Me',
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black54,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Forgot your password? "
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ForgotBody()));
                              },
                              child: Text(
                                'Click here',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.70,
                        height: 50,
                        margin: const EdgeInsets.only(top: 20, bottom: 20),
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.35,
                          child: RaisedButton(
                            onPressed: () {

                              setState(() {
                                isApiCallProcess = true;

                              });
                              if (_formKey.currentState.validate() &&
                                  _selectedLocation == "SignIn as Doctor") {
                                print("Validate1");
                                signIn(loginemail_controller.text,
                                    loginpassword_controller.text, '8');
                                if(_isSignedIn==false){
                                  //Error(errorMessage);
                                }
                              }
                              else if (_formKey.currentState.validate() &&
                                  _selectedLocation == "SignIn as Driver") {

                                print("Validate2");
                                signIn(loginemail_controller.text,
                                    loginpassword_controller.text, '9');
                                if(_isSignedIn==false){
                                  //  Error(errorMessage);
                                }
                              }

                              else if (_selectedLocation != "SignIn as Driver" &&
                                  _selectedLocation != "SignIn as Doctor") {
                                isApiCallProcess = false;
                                Fluttertoast.showToast(
                                    msg: "Please select an option of SignIn As",
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
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),

                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Don't have an account? "
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => SignUpBody()));
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                ),

              ],
            ),
          ),
          /* add child content here */
        ),

      ),
    );
  }

  signIn(String email, pass, customer_group_id) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
      'customer_group_id': customer_group_id
    };
    var jsonResponse = null;
//    var jsonResponse2 = jsonResponse['status'];
    var response = await http.post(
        "http://sub.dev.healthsolutions.com.pk/public/api/auth/vendor_login",
        body: data);
    jsonResponse = json.decode(response.body);
//    print(response);
    if (response.statusCode == 201 || response.statusCode == 200) {
 //     print(response.body);
      print(response.statusCode);

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
          _isSignedIn = true;
          isApiCallProcess = false;

        });

        var jsonResponse1 = jsonResponse['result']['access_token'];

        //sharedPreferences.setString('status', jsonResponse2['status']);

     //   print(
       //     "315251561564156415641564510564sdfas,dfbsdjfbhksdjbfkasjhd bfjsd fbhasd hs dfhasgdfvkawhefvashdgvfsghdfvh");
        sharedPreferences.setString(
            "access_token", jsonResponse['result']['access_token']);
         print(sharedPreferences.getString("access_token"));
        print("here");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavBarBody()));
        deactivate();

        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
        //     IconsCircle()), (Route<dynamic> route) => false);
      }
    }
    else {


      print(response.body);
      print(response.statusCode);

      var jsonResponse2 = jsonResponse['status'];
      var jsonResponse3 = jsonResponse['message'];
      errorMessage = jsonResponse3.toString();
      print(errorMessage);
      Error(errorMessage);
      setState(() {
        isApiCallProcess = false;

        _isLoading = false;
        _isSignedIn = false;


      });
      // print("-----------------");
      // print(jsonResponse2['status']);
      // print("-----------------");


    }
  }
  void Error(String errorMessage){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Error',
      desc: errorMessage,
      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  Future<void> checkLogin() async {
    print('hello');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String access_token = sharedPreferences.getString("access_token");
    print(access_token);
    if(access_token!=null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBarBody()));
      deactivate();
    }else{

    }




  }
}