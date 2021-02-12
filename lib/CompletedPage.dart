import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vendor_app/Helpers/Card_Helper2.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal2.dart';
class CompletedBody extends StatefulWidget {
  @override
  _CompletedBodyState createState() => _CompletedBodyState();
}

class _CompletedBodyState extends State<CompletedBody> {
  List<RideInProcess>  rideinprocess =[
    RideInProcess(OrderNo: "Order # 1", TotalAmount: "150 PKR", Name: "HammadJaved", Date: "12-08-2021", Time: "13:25", Delivery: "Cash On Delivery"),
    RideInProcess(OrderNo: "Order # 2", TotalAmount: "150 PKR", Name: "Shaji", Date: "12-08-2021", Time: "13:30", Delivery: "Credit Card"),

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
              Column(
                children: rideinprocess.map((orderinfo) {
                  // return Text('${quote.text} - ${quote.author}');
                  return CustomerCard(
                    orderinfo: orderinfo,

                    View: (){
                      showPopup();
                    },
                  );
                }).toList(),
              ),
            ],
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
  double _bottom = 0, _fromTop = 170, _screenHeight, _containerHeight = 300, _containerHeight2 = 383;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 350), vsync: this)
      ..addListener(() {
        Timer.periodic(Duration(milliseconds: 5), (timer) {
          if (_bottom < _screenHeight - _fromTop - _containerHeight || _bottom < _screenHeight - _fromTop - _containerHeight2) {
            _bottom += 1;
            setState(() {});
          }
        });
      });
    controller.forward();
  }

  var rating = 4.0;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            bottom: _bottom,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width*0.95,
             height: _containerHeight,
             margin: EdgeInsets.only(left: 20, right: 20),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.0),
               color: Colors.white,
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.05,
                 ),
                 Container(
                   alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width*0.75,
                   // margin: EdgeInsets.only(top: 8),
                   child: Text(
                     'You Completed Your Trip!',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 16,
                       decoration: TextDecoration.none,
                       fontWeight: FontWeight.w400,
                       fontFamily: 'Family Name',
                     ),
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.04,
                 ),
                 Container(
                   alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width*0.75,
                   child: Text(
                     'PKR.250',
                     style: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize: 30,
                       color: Colors.deepPurpleAccent,
                       decoration: TextDecoration.none,
                       fontFamily: 'Family Name',
                     ),
                   ),
                 ),
                 Container(
                   alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width*0.50,
                   child: Divider(
                     color: Colors.black,
                     thickness: 1,
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.02,
                 ),
                 Container(
                   alignment: Alignment.center,
                   width: MediaQuery.of(context).size.width*0.75,
                   // margin: EdgeInsets.only(top: 8),
                   child: Text(
                     'Total Time: 2 Hours',
                     style: TextStyle(
                       color: Colors.black,
                       fontSize: 17,
                       decoration: TextDecoration.none,
                       fontWeight: FontWeight.w500,
                       fontFamily: 'Family Name',
                     ),
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height*0.03,
                 ),
                 Container(
                   child: SmoothStarRating(
                     color: Color.fromRGBO(253, 191, 0, 100),
                     borderColor: Color.fromRGBO(253, 191, 0, 100),
                     rating: rating,
                     isReadOnly: true,
                     size: 30,
                     filledIconData: Icons.star,
                     halfFilledIconData: Icons.star_half,
                     defaultIconData: Icons.star_border,
                     starCount: 5,
                     allowHalfRating: true,
                     spacing: 1.0,
                     onRated: (value) {
                       print("rating value -> $value");
                       // print("rating value dd -> ${value.truncate()}");
                     },
                   ),

                 ),

               ],
             ),
              ),
          ),
          Positioned(
            bottom: _bottom,
            left: 0,
            right: 0,
            child: Container(
              height: 383,
              // height: 100,
            child: Image(
              // width: MediaQuery.of(context).size.width*0.30,
              // height: MediaQuery.of(context).size.height*0.49,
              // height: 313,
              image: AssetImage('asset/Images/jackpot.png'),
            ),

            alignment: Alignment.topCenter,

          ),
          )
          // Container(
          //   child: Image(
          //     width: MediaQuery.of(context).size.width*0.30,
          //     height: MediaQuery.of(context).size.height*0.49,
          //     // height: 313,
          //     image: AssetImage('asset/Images/jackpot.png'),
          //   ),
          //   alignment: Alignment.topCenter,
          //   margin: const EdgeInsets.only(top: 0),
          // ),
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