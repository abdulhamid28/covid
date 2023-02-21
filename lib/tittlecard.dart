import 'package:flutter/material.dart';
import 'myclipper.dart';

class titlecard extends StatelessWidget {
  String uppertext;
  String lowertext;
  String picture;
  titlecard(
      {required this.uppertext,
      required this.lowertext,
      required this.picture});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Myclipper(),
          child: Container(
            height: 350,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.blueAccent],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Image(
                      image: AssetImage(picture),
                      height: 299,
                      alignment: Alignment.bottomCenter,
                      width: 200,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: uppertext + '\n',
                              style: TextStyle(
                                  fontFamily: 'Solitreo',
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                            text: lowertext,
                            style: TextStyle(
                                fontFamily: 'Solitreo',
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
