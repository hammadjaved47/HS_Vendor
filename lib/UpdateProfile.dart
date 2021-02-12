
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/MyAccount.dart';
class UpdateProfileBody extends StatefulWidget {
  @override
  _UpdateProfileBodyState createState() => _UpdateProfileBodyState();
}

class _UpdateProfileBodyState extends State<UpdateProfileBody> {
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Update Profile',
          ),
        ),
      ),
      body: Container(
        // alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image:DecorationImage(
                image: AssetImage('asset/Images/background2.png'),
                scale: 1,
                fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey[400],
                  child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(85),
                    child: Image.file(
                      _image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.grey[200],
                    //     borderRadius: BorderRadius.circular(85)),
                    // width: 150,
                    // height: 150,
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      size: 80,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
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
                height: 55,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.black54,
                    primaryColorDark: Colors.black54,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black54)),
                      labelText: 'UserName',
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
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black54)),
                      labelText: 'Phone Number',
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarBody()));
                    },
                    color: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

              ),
              // Container(
              //   width: MediaQuery.of(context).size.width*0.80,
              //   height: 55,
              //   margin: EdgeInsets.only(top: 5, bottom: 5),
              //   child: new Theme(
              //     data: new ThemeData(
              //       primaryColor: Colors.deepPurpleAccent,
              //       primaryColorDark: Colors.deepPurpleAccent,
              //     ),
              //     child: TextField(
              //       keyboardType: TextInputType.emailAddress,
              //       decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.black54),
              //         ),
              //         border: new OutlineInputBorder(
              //             borderSide: new BorderSide(color: Colors.black54)),
              //         labelText: 'Country',
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
