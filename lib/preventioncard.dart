import 'package:flutter/material.dart';

class prevention extends StatelessWidget {
  String picture;
  String uppertext;
  String lowertext;
  prevention(
      {required this.picture,
      required this.lowertext,
      required this.uppertext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image(
            image: AssetImage(picture),
            height: 130,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: uppertext,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    TextSpan(
                        text: lowertext,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 150,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xffe5e5e5e5))),
    );
  }
}
