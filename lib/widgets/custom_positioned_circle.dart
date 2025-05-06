import 'package:flutter/material.dart';

class CustomPositionedCircle extends StatelessWidget {
  Offset offset;
  double size;
  Color color;
  double borderWidth;

  CustomPositionedCircle({
    required this.offset,
    required this.size,
    required this.color,
    required this.borderWidth
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      right: offset.dx,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:Border.all(
            color: color,
            width: borderWidth
          )
        ),
      ),
    );
  }
}
