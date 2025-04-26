import 'package:flutter/material.dart';


Widget buildPositiondCircle(
    Offset offset, double size, Color color, double borderWidth) {
  return Positioned(
    top: offset.dy,
    right: offset.dx,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: borderWidth,
          )),
    ),
  );
}
