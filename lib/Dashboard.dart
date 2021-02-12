import 'package:flutter/material.dart';
import 'package:vendor_app/AboutUs.dart';
import 'package:vendor_app/BottomNavBar.dart';
import 'package:vendor_app/Contact_Us.dart';
import 'package:vendor_app/Helpers/Card_Helper3.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal3.dart';
import 'package:vendor_app/Login_Page.dart';
import 'package:vendor_app/MainSignUp.dart';
import 'package:vendor_app/MyAccount.dart';
import 'package:vendor_app/MyDrawer.dart';
import 'package:vendor_app/MyWallet.dart';
import 'package:vendor_app/NotificationsPage.dart';
import 'package:vendor_app/PrivacyPolicy.dart';
import 'package:vendor_app/Terms&Condition.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: DashboardBody()
    );
  }
}


class DashboardBody extends StatefulWidget {
  @override
  _DashboardBodyState createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  bool _hasBeenPressed = false;
  bool _hasBeenPressed1 = false;

  List<ProgressCards> progresscards = [
    ProgressCards(title: "Sales",text: "PKR. 12,000", subtext: "+22% sale in this month"),
    ProgressCards(title: "Earning",text: "PKR. 13,000", subtext: "+27% sale in this month"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              "Dashboard",
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
                width: MediaQuery.of(context).size.width*1,
                margin: const EdgeInsets.only(top: 5, bottom: 5),

                // child: Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Material(
                //     color: Colors.white,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: <Widget>[
                //         Icon(Icons.search,color: Colors.black),
                //         Expanded(
                //           child: TextField(
                //             // textAlign: TextAlign.center,
                //             decoration: InputDecoration.collapsed(
                //               hintText: ' Search Product',
                //             ),
                //             // onChanged: (value) {
                //             //
                //             // },
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: FadeInImage.assetNetwork(
                        imageScale: 1,
                        width: 50,
                        placeholder: 'asset/Images/user.png',
                        image: 'https://example.com/image.jpg',
                      )
                  ),
                  Container(
                    child: Text(
                        'Hammad Javed',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ) ,
          ),

        ),
      ),
      drawer: MyDrawer(),

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
                height: MediaQuery.of(context).size.height*0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: progresscards.map((progresscard) {
                      // return Text('${quote.text} - ${quote.author}');
                      return DashBoardCard(
                        progresscard: progresscard,
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.35,
                      height: 40,
                      // alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurpleAccent,)
                      ),
                      child: FlatButton(
                        onPressed: (){
                          if(_hasBeenPressed1 == true){
                           _hasBeenPressed1 = false;
                          }
                          setState(() {
                            _hasBeenPressed = !_hasBeenPressed;
                          });
                        },
                        // color: _color,
                        color: _hasBeenPressed ? Colors.deepPurpleAccent : Colors.white,
                        textColor: _hasBeenPressed ? Colors.white : Colors.deepPurpleAccent,
                        child: Text(
                          'Last 7 Days',
                          style: TextStyle(
                            fontSize: 17,
                            // color: Colors.blue[900],
                          ),
                        ),

                      ),

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.36,
                      height: 40,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
                      // alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.deepPurpleAccent,)
                      ),
                      child: FlatButton(
                        onPressed: (){
                          if(_hasBeenPressed == true){
                            _hasBeenPressed = false;
                          }
                          setState(() {
                            _hasBeenPressed1 =! _hasBeenPressed1;
                          });
                        },
                        color: _hasBeenPressed1 ? Colors.deepPurpleAccent : Colors.white,
                        textColor: _hasBeenPressed1 ? Colors.white : Colors.deepPurpleAccent,
                        child: Text(
                          'Last Month',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),

                      ),

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.72,
                height: 55,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'GROSS SALE',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                        'PKR. 12,000',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.70,
                height: 55,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EARNINGS',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'PKR. 13,000',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      // bottomNavigationBar:
      // drawer: MyDrawer(),
    );
  }
}
