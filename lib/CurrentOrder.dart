import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Modals/CurrentCart_Modal.dart';
import 'package:vendor_app/Helpers/CurrentCard_Helper.dart';
class CurrentOrder extends StatefulWidget {
  @override
  _CurrentOrderState createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {

  List<CurrentCartModel> quotes = [
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
    CurrentCartModel(image: "",name: "Panadol",quantity: "250 ml",price: "Rs.100",counter: "Quantity 3"),
  ];


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
                return CurrentCartCard(
                  currentCartCard: quote,
                  delete: (){
                    setState(() {
                      quotes.remove(quote);
                    });
                  },

                );;
              }).toList()
          ),
        ),
      ),
    );
  }
}
