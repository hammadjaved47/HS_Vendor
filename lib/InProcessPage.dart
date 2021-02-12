import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Card_Helper2.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal2.dart';
import 'package:vendor_app/Map%20Folder/GoogleMap.dart';
class InProcessBody extends StatefulWidget {
  @override
  _InProcessBodyState createState() => _InProcessBodyState();
}

class _InProcessBodyState extends State<InProcessBody> {
  List<RideInProcess>  rideinprocess =[
    RideInProcess(OrderNo: "Order # 1", TotalAmount: "150 PKR", Name: "HammadJaved", Date: "12-08-2021", Time: "13:25", Delivery: "Cash On Delivery"),
    RideInProcess(OrderNo: "Order # 2", TotalAmount: "150 PKR", Name: "Shaji", Date: "12-08-2021", Time: "13:30", Delivery: "Credit Card"),

  ];
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MapView()));
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
