import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArcWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .080,
      child: new CustomPaint(
        painter: new _ArcPainter(),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  _ArcPainter();

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    Rect rect2 = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    Path path = Path()..arcTo(rect, 0.0, -pi / 1, true);

    Path path2 = Path()..arcTo(rect2, -1.0, 0, true);

    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
    canvas.drawPath(
        path2,
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke);
  }
}
