import 'package:flutter/material.dart';
import 'package:learncard/ui/shared/size_helper.dart';

class DashboardDetailCard extends StatelessWidget {
  const DashboardDetailCard({
    this.flavorColor = Colors.black54,
    this.flavor = 'Flavor Name',
  });

  final Color flavorColor;
  final String flavor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 2.0),
        color: Colors.greenAccent[400],
        borderRadius:
            BorderRadius.all(Radius.circular(displayHeight(context) * 0.02)),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.all(8),
      height: displayHeight(context) * 0.30,
      width: displayWidth(context) * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.icecream,
            size: displayHeight(context) * 0.15,
            color: flavorColor,
          )),
          SizedBox(
            height: displayHeight(context) * 0.04,
          ),
          Text(
            flavor,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: displayHeight(context) * 0.04,
                color: flavorColor),
          ),
        ],
      ),
    );
  }
}
