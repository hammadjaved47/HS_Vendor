import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/UpdateProduct.dart';
import 'package:vendor_app/Helpers/Card_Helper3.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal3.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetProducts extends StatefulWidget {
  @override
  _GetProductsState createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {

  bool isLoading = false;
  int counter=1;

  List data1;
  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(milliseconds: 100));

    counter++;

    print("load more");
    print(counter);
    // update data and loading status
    var response = await http.get(Uri.encodeFull("http://sub.dev.healthsolutions.com.pk/public/api/product_list?page=${counter.toString()}"),
        headers: {"Content-Type": "application/json"}
    );

    //print(response.body);


    setState(() {
      var convertDataTOJson = json.decode(response.body);
      data1 = convertDataTOJson['result']['data'];

      data.addAll(data1);
      isLoading = false;
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
            'Get Products',
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width*1,
        height: MediaQuery.of(context).size.height*1,
        decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('asset/Images/background2.png'),
              scale: 1,
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          children: [
            Expanded(
    child: NotificationListener<ScrollNotification>(
    onNotification: (ScrollNotification scrollInfo) {
    if (!isLoading && scrollInfo.metrics.pixels ==
    scrollInfo.metrics.maxScrollExtent) {
    _loadData();
    // start loading data
    setState(() {
    isLoading = true;
    });
    }
    },
      child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data == null ? 0:data.length,
              itemBuilder: (BuildContext context, int index) {
                return   Container(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),

                    ),

                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          height: 40,
                          child: IconButton(
                            onPressed: (){
                              delete(data[index]['id'].toString());
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width*0.28,
                                height: 170,
                                margin: EdgeInsets.only(left: 10, bottom: 5),
                                // decoration: BoxDecoration(
                                //   color: Colors.red,
                                // ),
                                decoration: BoxDecoration(

                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    )),
                                child: FadeInImage.assetNetwork(
                                  imageScale: 1,
                                  width: 50,
                                  placeholder: 'asset/Images/user.png',
                                  image:  data[index]['image'],
                                )
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8, bottom: 5),
                              width: MediaQuery.of(context).size.width*0.60,
                              height: 170,
                              // color: Colors.red,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      data[index]['model_name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(top: 8),
                                    width: MediaQuery.of(context).size.width*0.60,
                                    child: Text(
                                      data[index]['description'],
                                      style: TextStyle(
                                        color: Colors.red[600],
                                        fontWeight: FontWeight.w700,

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            data[index]['price'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   padding: EdgeInsets.only(left: 20),
                                        //   child: Text(
                                        //     'Rs.500',
                                        //     style: TextStyle(
                                        //       color: Colors.black,
                                        //       decoration: TextDecoration.lineThrough,
                                        //       decorationColor: Colors.red[800],
                                        //       decorationThickness: 2.5,
                                        //       fontSize: 14.0,
                                        //       fontWeight: FontWeight.w800,
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      RaisedButton(

                                        onPressed: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateProductBody(
                                                        id: data[index]['id'].toString(),
                                                      )));
                                        },
                                        child: Text(
                                          "Update",
                                          style: TextStyle(
                                              fontSize: 15
                                          ),

                                        ),
                                        color: Color.fromRGBO(98, 0, 238, 100),
                                        textColor: Colors.white,

                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );

              }
      ),
            ),
      ),
            Container(
              height: isLoading ? 50.0 : 0,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  delete(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var jsonResponse = null;
    print(data);
//    var jsonResponse2 = jsonResponse['status'];
    var response = await http.post("http://sub.dev.healthsolutions.com.pk/public/api/deleteproduct/$id");
    jsonResponse = json.decode(response.body);
    print(response.statusCode);
    if(response.statusCode == 201 || response.statusCode == 200) {

      print(response.body);
      print('here');
      // setState(() {
      print('here1');

      //   _isLoading = false;
      // });
      //sharedPreferences.setString('status', jsonResponse2['status']);
      setState(() {
     getJsonData();
      });
      print("Done");
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
      //     IconsCircle()), (Route<dynamic> route) => false);

    }
    else {
      print('hello');
      print(response.body);
      var jsonResponse2 = jsonResponse['status'];
      print(jsonResponse2);
      setState(() {

      });
      // print("-----------------");
      // print(jsonResponse2['status']);
      // print("-----------------");
    }
  }







  final String url = "http://sub.dev.healthsolutions.com.pk/public/api/product_list";

  List data;

  @override

  void initState()
  {
    super.initState();
    this.getJsonData();
  }
  List<CustomerModel> _productDetails=[];

  Future<String> getJsonData() async
  {
    print('hello');
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Content-Type": "application/json"}
    );

    //print(response.body);


    print(data);
    setState(() {
      var convertDataTOJson = json.decode(response.body);
      data = convertDataTOJson['result']['data'];
        // for (Map<String, dynamic> user in data) {
        //   _productDetails.add(CustomerModel.fromJson(user));
        // }


    }
    );
    // return "Success!";
  }
}


// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);


// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);


// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);



// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);


CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.result,
  });

  Result result;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.data,
  });

  List<Datum> data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.vendorId,
    this.categoryId,
    this.attributeId,
    this.brandId,
    this.rentId,
    this.name,
    this.modelName,
    this.shortDescription,
    this.description,
    this.image,
    this.price,
    this.productCost,
    this.rentPrice,
    this.specialPrice,
    this.specialPriceFrom,
    this.specialPriceTo,
    this.featured,
    this.packaging,
    this.weight,
    this.status,
    this.isApproved,
    this.onRent,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.vendor,
    this.category,
    this.inventory,
  });

  int id;
  int vendorId;
  int categoryId;
  int attributeId;
  int brandId;
  int rentId;
  String name;
  String modelName;
  dynamic shortDescription;
  String description;
  dynamic image;
  String price;
  String productCost;
  String rentPrice;
  String specialPrice;
  DateTime specialPriceFrom;
  DateTime specialPriceTo;
  int featured;
  String packaging;
  String weight;
  int status;
  int isApproved;
  int onRent;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic vendor;
  Category category;
  dynamic inventory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    vendorId: json["vendor_id"],
    categoryId: json["category_id"],
    attributeId: json["attribute_id"],
    brandId: json["brand_id"],
    rentId: json["rent_id"],
    name: json["name"],
    modelName: json["model_name"],
    shortDescription: json["short_description"],
    description: json["description"],
    image: json["image"],
    price: json["price"],
    productCost: json["product_cost"],
    rentPrice: json["rent_price"],
    specialPrice: json["special_price"],
    specialPriceFrom: DateTime.parse(json["special_price_from"]),
    specialPriceTo: DateTime.parse(json["special_price_to"]),
    featured: json["featured"],
    packaging: json["packaging"],
    weight: json["weight"],
    status: json["status"],
    isApproved: json["is_approved"],
    onRent: json["on_rent"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    vendor: json["vendor"],
    category: Category.fromJson(json["category"]),
    inventory: json["inventory"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "category_id": categoryId,
    "attribute_id": attributeId,
    "brand_id": brandId,
    "rent_id": rentId,
    "name": name,
    "model_name": modelName,
    "short_description": shortDescription,
    "description": description,
    "image": image,
    "price": price,
    "product_cost": productCost,
    "rent_price": rentPrice,
    "special_price": specialPrice,
    "special_price_from": specialPriceFrom.toIso8601String(),
    "special_price_to": specialPriceTo.toIso8601String(),
    "featured": featured,
    "packaging": packaging,
    "weight": weight,
    "status": status,
    "is_approved": isApproved,
    "on_rent": onRent,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "vendor": vendor,
    "category": category.toJson(),
    "inventory": inventory,
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.status,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  String name;
  String image;
  int status;
  int parentId;
  DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    parentId: json["parent_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "status": status,
    "parent_id": parentId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
