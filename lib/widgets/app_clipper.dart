import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    return null;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
