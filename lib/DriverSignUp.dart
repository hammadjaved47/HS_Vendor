import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/Validator/validation.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class GroupModel {
  String text;
  int index;
  bool selected;

  GroupModel({this.text, this.index, this.selected});
}
class DriverSignUp extends StatefulWidget {
  @override
  _DriverSignUpState createState() => _DriverSignUpState();
}

class _DriverSignUpState extends State<DriverSignUp> {
  File _image;
  String _path = 'License Image';
  File _image1;
  String _path1 = 'Add Image';

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _path =image.path;
      _image = image;
    });
  }
  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      print('Here');
      _path =image.path;
      // print(image.path);
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  _imgFromCamera1() async {
    File image1 = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _path1 =image1.path;
      _image1 = image1;
    });
  }
  _imgFromGallery1() async {
    File image1 = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      print('Here');
      _path1 =image1.path;
      // print(image.path);
      _image1 = image1;
    });
  }
  void _showPicker1(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery1();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera1();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  bool _isLoading = false;
  String gender = 'male';
  String country = '';
  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          gender = 'male';
          break;
        case 1:
          gender = 'female';
          break;
      }
    });
  }
  bool hidepassword = true;
  bool hidepassword1 = true;

  // bool valuefirst = false;

  final _formKey = GlobalKey<FormState>();
  // UserModel _user;

  final TextEditingController drivername_controller  = TextEditingController();
  final TextEditingController driverlastname_controller  = TextEditingController();
  final TextEditingController driveraddress_controller = TextEditingController();
  final TextEditingController driveremail_controller = TextEditingController();
  final TextEditingController driverpassword_controller = TextEditingController();
  final TextEditingController driverpasswordConfirmation_controller = TextEditingController();
  final TextEditingController driverphone_controller = TextEditingController();
  final TextEditingController drivercnic_controller = TextEditingController();

  String validatePass(value){

    if (value.length <= 0)
    {
      return 'Please enter your password';
    }
    if(value != driverpassword_controller.text)
    {
      return 'Passwords not matched..';
    }
    else{
      return null;
    }
  }

  String finaldate;

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order.toString().substring(0,11);
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

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
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up As Driver',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Image(
                  width: MediaQuery.of(context).size.width*0.75,
                  image: AssetImage('asset/Images/driver.png'),
                ),
               Form(
                 key: _formKey,
                   child: Column(
                     children: [
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 5, bottom: 5),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             controller: drivername_controller,
                             validator: validateDriverName,
                             decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black87),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black87)),
                                 labelText: 'Name'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         padding: EdgeInsets.only(bottom: 8, top: 15),
                         width: MediaQuery.of(context).size.width * 0.8,
                         child: Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black87,
                           ),
                           child: Container(
                             height: 50 ,
                             child: TextFormField(
                               controller: driverlastname_controller,
                               validator: validateDoctorName,
                               textCapitalization: TextCapitalization.none,
                               autovalidateMode: AutovalidateMode.onUserInteraction,
                               decoration: new InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black54),
                                     borderRadius: BorderRadius.circular(5)

                                 ),
                                 border: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.black54),
                                     borderRadius: BorderRadius.circular(5)
                                 ),
                                 labelText: 'Last Name',
                               ),
                             ),
                           ),
                         ),
                       ),

                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 5, bottom: 5),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: (value) {
                               if (validateDriverEmail(value) == false) {
                                 return 'Please Enter a valid email address';
                               }
                               return null;
                             },

                             controller: driveremail_controller,
                             keyboardType: TextInputType.emailAddress,
                             decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black87),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black87)),
                                 labelText: 'Email Address'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 5, bottom: 5),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             // autovalidate: false,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: validateDriverMobile,
                             controller: driverphone_controller,
                             keyboardType: TextInputType.phone,
                             decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black87),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black87)),
                                 labelText: 'Phone'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 5, bottom: 5),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             controller: driveraddress_controller,
                             validator: validateDriverAddress,
                             decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black87),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black87)),
                                 labelText: 'Address'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 5, bottom: 5),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: validateDriverCNIC,
                             controller: drivercnic_controller,
                             keyboardType: TextInputType.phone,
                             decoration: InputDecoration(
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black87),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black87)),
                                 labelText: 'CNIC'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 8, bottom: 8),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: validatePass,
                             controller: driverpassword_controller,
                             obscureText: hidepassword,
                             decoration: InputDecoration(
                                 suffixIcon: IconButton(
                                   onPressed: (){
                                     setState(() {
                                       hidepassword = !hidepassword;
                                     });
                                   },
                                   icon: Icon(
                                     hidepassword ? Icons.visibility_off : Icons.visibility,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black54),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black54)),
                                 labelText: 'Password'
                             ),
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 8, bottom: 8),

                         child: new Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                             primaryColorDark: Colors.black54,
                           ),
                           child: TextFormField(
                             obscureText: hidepassword1,
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: validatePass,
                             controller: driverpasswordConfirmation_controller,
                             decoration: InputDecoration(
                                 suffixIcon: IconButton(
                                   onPressed: (){
                                     setState(() {
                                       hidepassword1 = !hidepassword1;
                                     });
                                   },
                                   icon: Icon(
                                     hidepassword1 ? Icons.visibility_off : Icons.visibility,
                                   ),
                                 ),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(color: Colors.black54),
                                 ),
                                 border: new OutlineInputBorder(
                                     borderSide: new BorderSide(color: Colors.black54)),
                                 labelText: 'Confirm Password'
                             ),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: callDatePicker,
                         child: Container(
                           width: MediaQuery.of(context).size.width*0.80,
                           height: MediaQuery.of(context).size.height*0.08,
                           margin: EdgeInsets.only(top: 8, bottom: 8),
                           alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.black),
                             borderRadius: BorderRadius.circular(5),
                           ),
                           padding: const EdgeInsets.only(left: 10, right: 10 ),
                           child: finaldate == null
                               ? Text(
                             "Date Of Birth",
                             style: TextStyle(
                               color: Colors.black54,
                               fontSize: 11,
                             ),
                             textScaleFactor: 1.5,
                           )
                               : Text(
                             "$finaldate",
                             style: TextStyle(
                               color: Colors.black54,
                               fontSize: 11,
                             ),
                             textScaleFactor: 1.5,
                           ),
                         ),
                       ),
                       Container(
                         width: MediaQuery.of(context).size.width*0.80,
                         height: MediaQuery.of(context).size.height*0.08,
                         margin: EdgeInsets.only(top: 8, bottom: 8),
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.black54),
                           borderRadius: BorderRadius.circular(5),
                         ),

                         child: Theme(
                           data: new ThemeData(
                             primaryColor: Colors.black54,
                           ),

                           child: SizedBox(
                             width: 400,
                             height: 60,

                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: CountryCodePicker(
                                 favorite: [
                                   '+92'
                                 ],
                                 onInit: setCountry,
                                 onChanged: setCountry,
                                 initialSelection: '+92',
                                 showCountryOnly: true,
                                 showOnlyCountryWhenClosed: true,
                               ),
                             ),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           _showPicker1(context);
                         },
                         child: Container(

                           width: MediaQuery.of(context).size.width*0.80,
                           height: MediaQuery.of(context).size.height*0.08,
                           margin: EdgeInsets.only(top: 8, bottom: 8),

                           // color: Colors.blue,
                           child: _image1 != null
                               ? Container(
                               alignment: Alignment.centerLeft,
                               padding: const EdgeInsets.only(left: 10, right: 10 ),
                               // width: 20,
                               decoration: BoxDecoration(
                                 border: Border.all(color: Colors.black54),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                     _path1.substring(0,27),
                                     maxLines: 1,
                                     style: TextStyle(
                                       fontSize: 17,
                                       color: Colors.black54,
                                     ),
                                   ),
                                   Icon(
                                     Icons.filter,
                                     size: 25,
                                     color: Colors.black54,
                                   )
                                 ],
                               )

                           )
                               : Container(
                             width: 20,
                             alignment: Alignment.centerLeft,
                             padding: const EdgeInsets.only(left: 13, right: 13 ),
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.black54),
                                 borderRadius: BorderRadius.circular(5)),

                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   _path1,
                                   style: TextStyle(
                                     fontSize: 17,
                                     color: Colors.black54,
                                   ),
                                 ),
                                 Icon(
                                   Icons.filter,
                                   size: 25,
                                   color: Colors.black54,
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           _showPicker(context);
                         },
                         child: Container(

                           width: MediaQuery.of(context).size.width*0.80,
                           height: MediaQuery.of(context).size.height*0.08,
                           margin: EdgeInsets.only(top: 8, bottom: 8),

                           // color: Colors.blue,
                           child: _image != null
                               ? Container(
                               alignment: Alignment.centerLeft,
                               padding: const EdgeInsets.only(left: 10, right: 10 ),
                               // width: 20,
                               decoration: BoxDecoration(
                                 border: Border.all(color: Colors.black54),
                                 borderRadius: BorderRadius.circular(5),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                     _path.substring(0,27),
                                     maxLines: 1,
                                     style: TextStyle(
                                       fontSize: 17,
                                       color: Colors.black54
                                     ),
                                   ),
                                   Icon(
                                     Icons.filter,
                                     size: 25,
                                     color: Colors.black54,
                                   )
                                 ],
                               )

                           )
                               : Container(
                             width: 20,
                             alignment: Alignment.centerLeft,
                             padding: const EdgeInsets.only(left: 13, right: 13 ),
                             decoration: BoxDecoration(
                                 border: Border.all(color: Colors.black54),
                                 borderRadius: BorderRadius.circular(5)),

                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   _path,
                                   style: TextStyle(
                                     fontSize: 17,
                                     color: Colors.black54,
                                   ),
                                 ),
                                 Icon(
                                   Icons.filter,
                                   size: 25,
                                   color: Colors.black54,
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                       Row(

                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           ///----------------------Button 1
                           new Radio(
                             activeColor: Colors.deepPurpleAccent,
                             value: 0,
                             groupValue: _radioValue,
                             onChanged: _handleRadioValueChange,
                           ),
                           new Text(
                             'Male',
                             style: new TextStyle(fontSize: 16.0),
                           ),

                           ///----------------------Button 2
                           new Radio(
                             activeColor: Colors.deepPurpleAccent,
                             value: 1,
                             groupValue: _radioValue,
                             onChanged: _handleRadioValueChange,
                           ),

                           new Text(
                             'Female',
                             style: new TextStyle(
                               fontSize: 16.0,
                             ),
                           ),

                         ],
                       ),

                       Container(
                         width: MediaQuery.of(context).size.width *0.70,
                         height: MediaQuery.of(context).size.height *0.07,

                         child: SizedBox(
                           width: MediaQuery.of(context).size.width * 0.35,
                           child: RaisedButton(
                             onPressed: (){
                               if(_formKey.currentState.validate() && _image != null)
                               {
                                 signUp(driveremail_controller.text, driverpassword_controller.text, _path1, drivercnic_controller.text, _path, drivername_controller.text, driverlastname_controller.text, driverphone_controller.text, finaldate, gender, country, '9');
                                 print("Validate");

                               }
                               else{
                                 Fluttertoast.showToast(
                                     msg: "Please Add License Image",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.BOTTOM,
                                     timeInSecForIosWeb: 3,
                                     backgroundColor: Colors.grey[500],
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );
                                 print("Not Validate");
                               }

                             },
                             color: Colors.deepPurpleAccent,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(5.0),
                             ),
                             child: Text(
                               'SIGN UP',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 15,
                               ),
                             ),
                           ),
                         ),

                       ),
                     ],
                   )
               ),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        )

    );
  }
  signUp(String email, pass, image, cnic, licence, first_name, last_name, phone, dob, gender, country, customer_group_id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
      'image': image,
      'cnic': cnic,
      'licence': 'licence',
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'country': country,
      'customer_group_id': customer_group_id

    };
    var jsonResponse = null;
    print(data);
//    var jsonResponse2 = jsonResponse['status'];
    var response = await http.post("http://sub.dev.healthsolutions.com.pk/public/api/auth/vendor_signup", body: data);
    jsonResponse = json.decode(response.body);
    if(response.statusCode == 201) {

      print(response.body);
      print('here');
      if(jsonResponse != null) {
        // setState(() {
        print('here1');

        //   _isLoading = false;
        // });

        var jsonResponse1 = jsonResponse['result']['access_token'];

        //sharedPreferences.setString('status', jsonResponse2['status']);

        print("315251561564156415641564510564sdfas,dfbsdjfbhksdjbfkasjhd bfjsd fbhasd hs dfhasgdfvkawhefvashdgvfsghdfvh");
        sharedPreferences.setString("access_token", jsonResponse['result']['access_token']);
        print(sharedPreferences.getString("access_token"));
        print("Done");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Body()));
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
        //     IconsCircle()), (Route<dynamic> route) => false);
      }
    }
    else {
      print('hello');
      print(response.body);
      var jsonResponse2 = jsonResponse['status'];
      print(jsonResponse2);
      setState(() {
        _isLoading = false;
      });
      // print("-----------------");
      // print(jsonResponse2['status']);
      // print("-----------------");
    }
  }


  void setCountry(CountryCode value) {
    country = value.toCountryStringOnly();
    print(country);
  }
}
