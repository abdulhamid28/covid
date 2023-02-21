import 'package:flutter/material.dart';

class symptomcard extends StatelessWidget {
  String title;
  String picture;
  symptomcard({required this.picture, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Image(
              image: AssetImage(picture),
              height: 100,
              width: 150,
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontFamily: 'Anton'),
              ),
            )
          ],
        ),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xFFE5E5E5)),
        ),
      ),
    );
  }
}
