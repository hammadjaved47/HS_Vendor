import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal2.dart';
class CustomerCard extends StatelessWidget {

  final RideInProcess orderinfo;
  final Function View;
  CustomerCard({this.orderinfo, this.View});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(

          child: InkWell(
            onTap: View,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.90,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width*0.20,
                        // height: 60,
                        child: Text(
                          orderinfo.OrderNo,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width*0.20,
                        // height: 60,
                        child: Text(
                          orderinfo.TotalAmount,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.90,
                  child: Text(
                    orderinfo.Name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        // width: MediaQuery.of(context).size.width*0.75,
                        // height: 60,
                        child: Text(
                          orderinfo.Date,
                        ),
                        // margin: EdgeInsets.only(left: 0),
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width*0.25,
                        // height: 60,
                        child: Text(
                          orderinfo.Time,
                        ),
                      ),
                      Container(
                        // alignment: Alignment.centerRight,
                        width: 171,
                        // height: 60,
                        child: ListTile(
                          title: Text(
                            orderinfo.Delivery,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
