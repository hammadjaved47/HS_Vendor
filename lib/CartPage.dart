import 'package:flutter/material.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/OrderHistory.dart';
import 'package:vendor_app/CurrentOrder.dart';
class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
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
                  "Cart",
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontSize: 19.0,fontFamily: 'Family Name'),  //For Selected tab
              unselectedLabelStyle: TextStyle(fontSize: 17.0,fontFamily: 'Family Name'),
              tabs: [
                Tab(text: "Current Order",),
                Tab(text: "Order History",),
              ],
            ),

          ),
          drawer: MyDrawer(),

          body: TabBarView(
            children: [
              CurrentOrder(),
              OrderHistory(),
            ],
          ),
        ),
      ),

    );

  }
}
