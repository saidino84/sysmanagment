import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/global/score_repository.dart';

import '../transferencias/wallet_pallets.dart';

class Score {
  double value;
  DateTime horas;
  Score({required this.horas, required this.value});
}

class ManualGraphicChart extends StatefulWidget {
  ManualGraphicChart({
    super.key,
    required this.size,
  });

  Size size;
  late double _min, _max;

  @override
  initState() {
    _max = double.maxFinite;
    _min = double.maxFinite;

    ScoreRepository.scores.forEach((element) {
      _max = _max < element.value ? element.value : _max;
      _min = _min < element.value ? element.value : _min;
    });
  }

  @override
  State<ManualGraphicChart> createState() => _ManualGraphicChartState();
}

class _ManualGraphicChartState extends State<ManualGraphicChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(
          top: defaultPadding,
          left: defaultPadding / 2,
          right: defaultPadding / 2),
      width: widget.size.width,
      decoration: BoxDecoration(
          color: TransferPalet.darkcolor,
          borderRadius: BorderRadius.circular(20)),
      child: CustomPaint(
        child: Container(),
        painter: MyGraphicsPaineter(),
      ),
    );
  }
}

class MyGraphicsPaineter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centro = Offset(size.width / 2, size.height / 2);
    desenhaBgGradient(canvas, centro, size);
    desenhCircle(size, canvas);
    // path.
  }

  desenhCircle(Size size, Canvas canvas) {
    canvas.drawCircle(Offset(50, 50), 20, Paint()..color = Colors.white);
    // canvas.drawArc(Rectangle(30, 50, 150, 150), startAngle, sweepAngle, useCenter, paint)
  }

  desenhaBgGradient(Canvas cv, Offset centro, Size size) {
    final w = 300.0;

    var gradient = RadialGradient(
      colors: [Color(0xffa60112), Color(0xff01182b)],
      center: Alignment(
        -w / size.width + 0.2,
        w / size.height - 0.2,
      ),
      radius: 1.0,
      stops: [0.0, 1.0],
    );
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()..shader = gradient.createShader(rect);
    cv.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
