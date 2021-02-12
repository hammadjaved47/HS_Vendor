import 'package:flutter/material.dart';
import 'package:vendor_app/CompletedPage.dart';
import 'package:vendor_app/InProcessPage.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:flutter_switch/flutter_switch.dart';

class TripBody extends StatefulWidget {
  @override
  _TripBodyState createState() => _TripBodyState();
}

class _TripBodyState extends State<TripBody> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
          "Trips"
    ),
        ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 13, bottom: 13, right: 5, left: 5),
        child: FlutterSwitch(
          width: 68.0,
          valueFontSize: 15.0,
          toggleSize: 20.0,
          value: status,
          borderRadius: 30.0,
          // padding: 8.0,
          showOnOff: false,
          onToggle: (val) {
            setState(() {
              status = val;
            });
          },
        ),
      ),
    ],
    bottom: TabBar(
    indicatorColor: Colors.white,
    labelStyle: TextStyle(fontSize: 19.0,fontFamily: 'Family Name'),  //For Selected tab
    unselectedLabelStyle: TextStyle(fontSize: 17.0,fontFamily: 'Family Name'),
    tabs: [
    Tab(text: "In Process",),
    Tab(text: "Completed",),
    ],
    ),

    ),
          drawer: MyDrawer(),

          body: TabBarView(
    children: [
      InProcessBody(),
      CompletedBody(),
    ],
    ),
    ),
    ),

    );
  }
}
