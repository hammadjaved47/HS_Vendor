import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Modals/OrderCard_Modal.dart';

class CartCard extends StatelessWidget {

  final CartModel cartModel;
  final Function view;
  const CartCard({Key key, this.cartModel,this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0 ,0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text(
              cartModel.date,
              textAlign: TextAlign.end,

              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(height: 6.0),



            Text(
              cartModel.order_id,

              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurpleAccent,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 6.0),

            Row(

              children: [
                Image.asset('asset/Images/delivery_truck.png'),

                Container(
                  margin: EdgeInsets.only(left: 5,right: 5),
                  child: Text(
                    cartModel.shipping_status,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[800]
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height: 6.0),

            SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: (){
                    view();
                  },
                  child: Text(
                    "View",
                    style: TextStyle(
                        fontSize: 15
                    ),

                  ),
                  color: Color.fromRGBO(98, 0, 238, 100),
                  textColor: Colors.white,

                ),

                Container(
                  child: Text(
                    cartModel.total,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                ),
              ],
            ),

          ],


        ),
      ),
    );
  }
}
