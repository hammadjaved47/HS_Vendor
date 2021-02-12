import 'dart:io';
import 'dart:convert';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  File _image;
  String base64Image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );


    setState(() {
      _image = image;
      List<int> imageBytes = image.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      print(base64Image);

    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;

      List<int> imageBytes = image.readAsBytesSync();
      base64Image = base64Encode(imageBytes);
      print(base64Image);
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

  String finaldate1;

  void callDatePicker1() async {
    var order1 = await getDate1();
    setState(() {
      finaldate1 = order1.toString().substring(0,11);
    });
  }

  Future<DateTime> getDate1() {
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


  final _formKey = GlobalKey<FormState>();
  final TextEditingController productname_controller  = TextEditingController();
  final TextEditingController modelname_controller  = TextEditingController();
  final TextEditingController description_controller = TextEditingController();
  final TextEditingController shortdescription_controller = TextEditingController();
  final TextEditingController price_controller = TextEditingController();
  final TextEditingController productCost_controller = TextEditingController();
  final TextEditingController specialPrice_controller = TextEditingController();
  final TextEditingController packaging_controller = TextEditingController();
  final TextEditingController quantity_controller = TextEditingController();
  final TextEditingController rentPrice_controller = TextEditingController();
  final TextEditingController attribute_controller = TextEditingController();
  final TextEditingController brandId_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            'Add Products',
          ),
        ),
      ),
      drawer: MyDrawer(),
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.blue[200],
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),

                            child: Image(
                              width: 140,
                              height: 140,
                              image: AssetImage(
                                'asset/Images/product.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
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
                        child: TextFormField(
                          controller: productname_controller,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Product Name',
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
                        child: TextFormField(
                          controller: modelname_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Model Name',
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
                        child: TextFormField(
                          controller: description_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Description',
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
                        child: TextFormField(
                          controller: shortdescription_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Short Description',
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
                        child: TextFormField(
                          controller: price_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Price',
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
                        child: TextFormField(
                          controller: productCost_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Product Cost',
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
                        child: TextFormField(
                          controller: specialPrice_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Special Price',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: callDatePicker,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.80,
                        height: 55,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10 ),
                        child: finaldate == null
                            ? Text(
                          "Special Price From",
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
                    InkWell(
                      onTap: callDatePicker1,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.80,
                        height: 55,
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10 ),
                        child: finaldate1 == null
                            ? Text(
                          "Special Price To",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                          textScaleFactor: 1.5,
                        )
                            : Text(
                          "$finaldate1",
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
                      height: 55,
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black54,
                          primaryColorDark: Colors.black54,
                        ),
                        child: TextFormField(
                          controller: packaging_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Packaging',
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
                        child: TextFormField(
                          controller: quantity_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Quantity',
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
                        child: TextFormField(
                          controller: rentPrice_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Rent Price',
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
                        child: TextFormField(
                          controller: attribute_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Attribute',
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
                        child: TextFormField(
                          controller: brandId_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black54)),
                            labelText: 'Brand Id',
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
                         if(_image != null){
                           addProduct(productname_controller.text, modelname_controller.text, shortdescription_controller.text, base64Image, description_controller.text, price_controller.text, productCost_controller.text, specialPrice_controller.text, finaldate, finaldate1, packaging_controller.text, quantity_controller.text, rentPrice_controller.text, attribute_controller.text, brandId_controller.text);
                           print('Products Added');
                         }
                         else{
                           Fluttertoast.showToast(
                               msg: "Please Add Product Image",
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
                            'Add Product',
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
              )
            ],
          ),
        ),
      ),

    );
  }
  bool _isLoading = false;
  addProduct(String productname, modelname, shortdescription, image, description, price, productcost, specialprice, specialpricefrom, specialpriceto, packaging, quantity, rentprice, attribute, brandid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': productname,
      'model_name': modelname,
      'short_description': shortdescription,
      'description': description,
      'image': image,
      'price': price,
      'product_cost': productcost,
      'special_price': specialprice,
      'special_price_from': specialpricefrom,
      'special_price_to': specialpriceto,
      'packaging': packaging,
      'quantity': quantity,
      'rent_price': rentprice,
      'attribute': attribute,
      'brand_id': brandid,
      'vendor_id': '1',
      'category_id': '2',
      'attribute_id': '6',
      'on_rent': '0',
      'status': '1',
      'is_approved': '1',
      'featured': '1',
      'rent_id':'11'

    };

    var jsonResponse = null;
    print(data);
//    var jsonResponse2 = jsonResponse['status'];
    var response = await http.post("http://sub.dev.healthsolutions.com.pk/public/api/add_product", body: data);
    jsonResponse = json.decode(response.body);
    print(response.statusCode);
    if(response.statusCode == 201 || response.statusCode == 200) {

    print(response.body);
    print('here');
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarBody()));
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
    //     IconsCircle()), (Route<dynamic> route) => false);

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
}

