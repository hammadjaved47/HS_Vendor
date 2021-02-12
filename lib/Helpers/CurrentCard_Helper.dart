import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Modals/CurrentCart_Modal.dart';

class CurrentCartCard extends StatelessWidget {

  final CurrentCartModel currentCartCard;
  final Function delete;
  const CurrentCartCard({Key key, this.currentCartCard,this.delete}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0 ,0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
                width: 100,
                placeholder: 'assets/noproduct.png',
                image: 'https://i-cf5.gskstatic.com/content/dam/cf-consumer-healthcare/panadol/en_ie/ireland-products/panadol-tablets/MGK5158-GSK-Panadol-Tablets-455x455.png?auto=format'
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  width: MediaQuery.of(context).size.width*0.56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentCartCard.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.topRight,
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: (){delete();},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.0),

                Text(
                  currentCartCard.quantity,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700]
                  ),
                ),
                SizedBox(height: 6.0),

                Container(
                  width: MediaQuery.of(context).size.width*0.56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentCartCard.counter,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurpleAccent
                        ),
                      ),
                      Text(
                        currentCartCard.price,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.deepPurpleAccent
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

