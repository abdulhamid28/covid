import 'package:flutter/material.dart';

class casecard extends StatelessWidget {
  int count;
  String str;

  casecard({required this.count, required this.str});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 190,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0XFFB71C1C)),
            ),
            child: Text(
              'LIVE STATUS ',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            '$count',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontFamily: 'Anton',
                color: Colors.blue[900]),
          ),
          Text(
            str,
            style: TextStyle(
                fontFamily: 'Anton',
                letterSpacing: 1.2,
                fontSize: 25,
                color: Colors.black),
          )
        ],
      ),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0XFFE5E5E5)),
          borderRadius: BorderRadius.circular(25)),
    );
  }
}
