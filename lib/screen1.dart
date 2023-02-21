// ignore_for_file: non_constant_identifier_names
import 'screen_3.dart';

import 'tittlecard.dart';

import 'package:flutter/material.dart';
import 'covid_request.dart';

// ignore: non_constant_identifier_names
int infected_count = 0;
int death_count = 0;
int cured_count = 0;

dynamic request(int gg) async {
  covidrequest response = covidrequest(country: gg);
  await response.fetch_details();
  infected_count = response.infected;
  cured_count = response.cured;
  death_count = response.death;
}

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  List<String> list = ['INDIA', 'ALGERIA', 'ARGENTINA'];

  String? dropdowndefaultvalue = 'INDIA';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            titlecard(
              uppertext: 'Stay Home',
              lowertext: 'Stay Safe',
              picture: 'assests/doc.png',
            ),
            Container(
              height: 70,
              margin: const EdgeInsets.fromLTRB(15, 40, 15, 30),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color(0XFFE5E5E5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 35,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                          iconSize: 40,
                          icon:
                              const Center(child: Icon(Icons.arrow_drop_down)),
                          iconEnabledColor: Colors.blue,
                          style: const TextStyle(
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20),
                          isExpanded: true,
                          underline: const SizedBox(),
                          value: dropdowndefaultvalue,
                          items: list.map<DropdownMenuItem<String>>(
                            (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdowndefaultvalue = newValue;
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return live_status();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(3),
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
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: 'Case Update\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Last updated on JUST NOW  ',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    RawMaterialButton(
                        child: const Icon(
                          Icons.refresh_sharp,
                          color: Colors.black,
                          size: 40,
                        ),
                        shape: const CircleBorder(),
                        onPressed: () async {
                          int countrycode = 0;
                          if (dropdowndefaultvalue == 'INDIA') {
                            countrycode = 94;
                          } else if (dropdowndefaultvalue == 'ALGERIA') {
                            countrycode = 2;
                          } else if (dropdowndefaultvalue == 'ARGENTINA') {
                            countrycode = 7;
                          }
                          await request(countrycode);
                          setState(() {
                            // print(infected_count);
                            // print(cured_count);
                            // print(death_count);
                            infected_count;
                            cured_count;
                            death_count;
                          });
                        })
                  ]),
            ),
            Expanded(
              child: Stack(children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '*');
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 40, 40, 50),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'GET TO KNOW  \n',
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: 'COVID-19',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    height: 240,
                    image: AssetImage(
                      'assests/virus1.png',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0XFFE5E5E5)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              '$infected_count',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontFamily: 'Anton'),
                            ),
                            const Text(
                              'INFECTED',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Anton'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red[900],
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.red),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              '$death_count',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[900],
                                  fontSize: 20,
                                  fontFamily: 'Anton'),
                            ),
                            Text(
                              'DEATH',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Anton'),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                              padding: const EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(
                              '$cured_count',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontFamily: 'Anton'),
                            ),
                            const Text(
                              'CURED',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Anton'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
