import 'package:flutter/material.dart';
import 'package:vendor_app/MyDrawer.dart';

void main() => runApp(ReportBody());

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportBody(),
    );
  }
}
class ReportBody extends StatefulWidget {
  @override
  _ReportBodyState createState() => _ReportBodyState();
}

class _ReportBodyState extends State<ReportBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Center(
          child: Text(
            "Report",
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
              Image(
                width: MediaQuery.of(context).size.width*0.90,
                // height: MediaQuery.of(context).size.height*0.35,
                image: AssetImage(
                  'asset/Images/report.png',
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                            'asset/Images/statistics2.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35,),
                        child: Text(
                          'Sales Report',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                            'asset/Images/package.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35,),
                        child: Text(
                          'Low Stock',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                            'asset/Images/survey.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35,),
                        child: Text(
                          'Order Report',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  height: 55,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.5, // Move to right 10  horizontally
                          0.5, // Move to bottom 10 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Image(
                          // width: MediaQuery.of(context).size.width*0.65,
                          // height: MediaQuery.of(context).size.height*0.35,
                          image: AssetImage(
                            'asset/Images/survey.png',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35,),
                        child: Text(
                          'Review Report',
                          style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
