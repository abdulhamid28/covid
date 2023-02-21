import 'preventioncard.dart';
import 'package:flutter/material.dart';
import 'tittlecard.dart';
import 'sympotomscard.dart';

class precautions extends StatefulWidget {
  const precautions({Key? key}) : super(key: key);

  @override
  State<precautions> createState() => _precautionsState();
}

class _precautionsState extends State<precautions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              titlecard(
                  uppertext: 'Wear Mask  ',
                  lowertext: 'Outside',
                  picture: 'assests/fmly.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Symptoms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontFamily: 'Anton'),
              ),
              Row(
                children: [
                  symptomcard(title: 'Headache', picture: 'assests/head.png'),
                  symptomcard(
                      title: 'Breathing', picture: 'assests/breathing.png'),
                  symptomcard(
                      title: 'Feverish', picture: 'assests/feverish.png'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Preventions',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontFamily: 'Anton'),
              ),
              prevention(
                  picture: 'assests/stayhome.png',
                  uppertext: 'Avoid Unnecessary Gathering',
                  lowertext:
                      '\n\nRecently Corona has been\nspreading rapidly through \n'
                      'crowd.'),
              prevention(
                picture: 'assests/handsanitiser.png',
                uppertext: 'Sanitize your Hand',
                lowertext:
                    '\n\nResearchers has found that\nperson who keeps himself\nsanitize regularly are diseases\n free.',
              ),
              prevention(
                  picture: 'assests/pngimg.com - vaccine_PNG13.png',
                  uppertext: 'Covid -19 Vaccine',
                  lowertext:
                      '\n\nHaving two dosage of covid\nvaccine builts up immunity.'),
            ],
          ),
        ),
      ),
    );
  }
}
