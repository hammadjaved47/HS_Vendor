import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/OrderCard_Helper.dart';
import 'package:vendor_app/Helpers/Modals/OrderCard_Modal.dart';


class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {


  List<CartModel> quotes = [
    CartModel(date: "Febuary 20th 2020",shipping_status: "Shipped",order_id: "Order # 229",total: "Total: Rs.100"),
    CartModel(date: "Febuary 20th 2020",shipping_status: "Shipped",order_id: "Order # 229",total: "Total: Rs.100"),
    CartModel(date: "Febuary 20th 2020",shipping_status: "Shipped",order_id: "Order # 229",total: "Total: Rs.100"),
    CartModel(date: "Febuary 20th 2020",shipping_status: "Shipped",order_id: "Order # 229",total: "Total: Rs.100"),


  ];

  void showPopup() {
    showDialog(
      context: context,
      builder: (_) => PopUp(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Container(
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
              children: quotes.map((quote) {
                //return Text('${quote.text} - ${quote.author}');
                return CartCard(
                  cartModel: quote,
                  view: (){
                    showPopup();
                  },

                );;
              }).toList()
          ),
        ),
      ),
    );
  }
}

class PopUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopUpState();
}

class PopUpState extends State<PopUp> with TickerProviderStateMixin {
  AnimationController controller;
  double _bottom = 0, _fromTop = 100, _screenHeight, _containerHeight = 420;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() {
        Timer.periodic(Duration(milliseconds: 1), (timer) {
          if (_bottom < _screenHeight - _fromTop - _containerHeight) {
            _bottom += 1;
            setState(() {});
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: _bottom,
            left: 0,
            right: 0,
            child: Container(
              height: _containerHeight,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      width: MediaQuery.of(context).size.width*0.87,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent[100],
                          borderRadius: BorderRadius.circular(10)
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Order # 201",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Row(
                            children: [
                              Image(
                                  image: AssetImage('asset/Images/delivery_truck.png'),
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width*0.08,
                              ),
                              Text("Shipped",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  fontFamily: 'Family Name',
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ), Text("Feburary 2,2021",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),

                    ),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Vicks Day Quil",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text("1pcs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('Rs. 24.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Vicks Day Quil",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text("1pcs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('Rs. 24.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Vicks Day Quil",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          Text("1pcs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('Rs. 24.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Family Name',
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width*0.80,
                      height: 50,
                      child: Text(
                        'Total: Rs. 72',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurpleAccent,
                          fontFamily: 'Family Name',
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

