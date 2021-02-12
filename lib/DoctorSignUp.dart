import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/Validator/validation.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:http/http.dart' as http;
class DoctorSignUpBody extends StatefulWidget {
  @override
  _DoctorSignUpBodyState createState() => _DoctorSignUpBodyState();
}

class _DoctorSignUpBodyState extends State<DoctorSignUpBody> {
  bool hidepassword = true;
  bool hidepassword2 = true;

  int _radioValue = 0;
  bool _isLoading = false;
  String gender = 'male';
  String country = '';
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

  File _image;
  String _path = 'Add Image';


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

  final _formKey = GlobalKey<FormState>();

  final TextEditingController doctorfirstname_controller  = TextEditingController();
  final TextEditingController doctorlastname_controller  = TextEditingController();
  final TextEditingController hospital_controller = TextEditingController();
  final TextEditingController qualification_controller = TextEditingController();
  final TextEditingController speciality_controller = TextEditingController();
  final TextEditingController experience_controller = TextEditingController();
  final TextEditingController doctoremail_controller = TextEditingController();
  final TextEditingController doctorpassword_controller = TextEditingController();
  final TextEditingController doctorpasswordConfirmation_controller = TextEditingController();
  final TextEditingController doctoraddress_controller  = TextEditingController();
  final TextEditingController doctorphone_controller = TextEditingController();
  final TextEditingController doctorcnic_controller = TextEditingController();

  String validateDoctorPassword(value){

    if (value.length <= 0)
    {
      return 'Please enter your password';
    }
    if(value != doctorpassword_controller.text)
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
    double width = MediaQuery.of(context).size.width*1;
    double height = MediaQuery.of(context).size.height*1;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,

          body: Container(

            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*1,
            decoration: BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('asset/Images/background.jpeg'),
                    scale: 1,
                    fit: BoxFit.fill
                )
            ),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.0,),

                  Container(
                    margin: EdgeInsets.only(top: 30,bottom: 30),
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up as Doctor',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width*0.75,
                    image: AssetImage('asset/Images/doctors.png'),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                                controller: doctorfirstname_controller,
                                validator: validateDoctorName,
                                textCapitalization: TextCapitalization.none,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: new InputDecoration(

                                  prefix: Container(
                                    child: Text('Dr.'),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(5)

                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black54),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  labelText: 'First Name',
                                ),
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
                                controller: doctorlastname_controller,
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

                        new Row(

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
                          width: MediaQuery.of(context).size.width*0.80,
                          height: MediaQuery.of(context).size.height*0.08,
                          margin: EdgeInsets.only(top: 5, bottom: 5),

                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.black54,
                              primaryColorDark: Colors.black54,
                            ),
                            child: TextFormField(
                              controller: hospital_controller,
                              validator: validateHospital,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.black87)),
                                  labelText: 'Hospital'
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
                              controller: qualification_controller,
                              validator: validateQualification,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.black87)),
                                  labelText: 'Qualification'
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
                              controller: speciality_controller,
                              validator: validateSpeciality,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.black87)),
                                  labelText: 'Speciality'
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
                              controller: experience_controller,
                              validator: validateExperience,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.black87)),
                                  labelText: 'Experience'
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

                              controller: doctoremail_controller,
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

                        // Container(
                        //   height: 30.0,
                        //   width: 320.0,
                        //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                        //
                        //   decoration: ShapeDecoration(
                        //
                        //     shape: RoundedRectangleBorder(
                        //         side: BorderSide(width: 1.0,color: Colors.black, style: BorderStyle.solid),
                        //         borderRadius: BorderRadius.only(
                        //           bottomLeft: Radius.circular(12.0),
                        //           topLeft: Radius.circular(12.0),
                        //           bottomRight: Radius.circular(12.0),
                        //         )
                        //     ),
                        //   ),
                        //   child:    DateTimePicker(
                        //     type: DateTimePickerType.date,
                        //     dateMask: 'yyyy/MM/dd',
                        //     controller: _controller3,
                        //     //initialValue: _initialValue,
                        //     firstDate: DateTime(2000),
                        //     lastDate: DateTime(2100),
                        //     icon: Icon(Icons.event),
                        //     // fieldHintText: "drf",
                        //     // dateLabelText: 'Date',
                        //     //locale: Locale('en', 'US'),
                        //     onChanged: (val) => setState(() => _valueChanged3 = val),
                        //     validator: (val) {
                        //       setState(() => _valueToValidate3 = val);
                        //       return null;
                        //     },
                        //     onSaved: (val) => setState(() => _valueSaved3 = val),
                        //   ),
                        // ),
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
                              controller: doctoraddress_controller,
                              validator: validateDoctorAddress,
                              keyboardType: TextInputType.text,
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
                              validator: validateDoctorMobile,
                              controller: doctorphone_controller,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black87),
                                  ),
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.black87)),
                                  labelText: 'Phone Number'
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
                              validator: validateDoctorCNIC,
                              controller: doctorcnic_controller,
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
                              validator: validateDoctorPassword,
                              controller: doctorpassword_controller,
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
                              obscureText: hidepassword2,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: validateDoctorPassword,
                              controller: doctorpasswordConfirmation_controller,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hidepassword2 = !hidepassword2;
                                      });
                                    },
                                    icon: Icon(
                                      hidepassword2 ? Icons.visibility_off : Icons.visibility,
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


                        SizedBox(height: 15.0,),
                        Container(
                          width: MediaQuery.of(context).size.width *0.70,
                          height: MediaQuery.of(context).size.height *0.06,

                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: RaisedButton(
                              onPressed: (){
                                if(_formKey.currentState.validate())
                                {
                                  signUp(doctoremail_controller.text, doctorpassword_controller.text, experience_controller.text, qualification_controller.text, _path, hospital_controller.text, doctorcnic_controller.text, doctorfirstname_controller.text, doctorlastname_controller.text, doctorphone_controller.text, finaldate, gender, country, '8');



                                }
                              },
                              color: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0,),

                ],


              ),
            ),
          ),
        )
      ],
    );

  }

  signUp(String email, pass, experience, qualification, image, hospital, cnic, first_name,last_name, phone, dob, gender, country, customer_group_id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass,
      'experience': experience,
      'qualification': qualification,
      'image': image,
      'hospital': hospital,
      'cnic': cnic,
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'country': country,
      'customer_group_id': customer_group_id

    };
    var jsonResponse = null;
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

