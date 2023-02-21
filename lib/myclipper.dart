import 'package:flutter/material.dart';

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var curve1start = Offset(size.width / 2.8, size.height - 150);
    var curve1end = Offset(size.width / 1.5, size.height - 35);
    path.quadraticBezierTo(
        curve1start.dx, curve1start.dy, curve1end.dx, curve1end.dy);
    var curve2start = Offset(size.width / 1.3, size.height);
    var curve2end = Offset(size.width, size.height);
    path.quadraticBezierTo(
        curve2start.dx, curve2start.dy, curve2end.dx, curve2end.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
