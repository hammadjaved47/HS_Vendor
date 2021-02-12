import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/CartPage.dart';
import 'package:vendor_app/Dashboard.dart';
import 'package:vendor_app/InProcessPage.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/Report.dart';
import 'package:vendor_app/TripsPage.dart';


void main() => runApp(Navbar());

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: NavBarBody(),
    );
  }
}
class NavBarBody extends StatefulWidget {
  @override
  _NavBarBodyState createState() => _NavBarBodyState();
}

class _NavBarBodyState extends State<NavBarBody> {
  int _currentIndex;
  List<Widget> _children;

  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      DashboardBody(),
      CartBody(),
      ReportBody(),
      TripBody(),
      MyAccountBody(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentIndex], // new
        bottomNavigationBar: CupertinoTabBar(
          onTap: onTabTapped, // new
            currentIndex: _currentIndex,
          backgroundColor: Colors.deepPurpleAccent,
          inactiveColor: Colors.black45,
          activeColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Dashboard"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.aspect_ratio),
                title: Text("Reports")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text("Trips"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text("Account"),
            ),
          ],
          // currentIndex: 0,
        )
      );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
