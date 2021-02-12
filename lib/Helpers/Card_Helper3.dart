import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal.dart';
import 'package:vendor_app/Helpers/Modals/Card_Modal3.dart';


class DashBoardCard extends StatelessWidget {

  final ProgressCards progresscard;
  DashBoardCard({this.progresscard});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width*0.45,
                width: 170,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        progresscard.title,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[600],
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 9, right: 9),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 9, right: 9),
                      child: Image(
                        image: AssetImage('asset/Images/tick.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width*0.45,
                height: 55,
                width: 170,
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  title: Text(
                    progresscard.text,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  subtitle: Text(
                    progresscard.subtext,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width*0.45,
                height: 100,
                width: 170,
                child: Image(
                  alignment: Alignment.center,
                  image: AssetImage('asset/Images/Graph.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
