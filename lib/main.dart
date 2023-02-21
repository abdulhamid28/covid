import 'package:covid_app/screen_3.dart';
import 'package:flutter/material.dart';
import 'covid_request.dart';
import 'screen1.dart';
import 'screen_2.dart';
import 'package:covid_app/screen_3.dart';

void main() {
  runApp(screen_0());
}

class screen_0 extends StatefulWidget {
  @override
  State<screen_0> createState() => _screen_0State();
}

class _screen_0State extends State<screen_0> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => screen1(),
        '*': (context) => precautions(),
      },
    );
  }
}
