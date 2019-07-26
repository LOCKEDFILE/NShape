import 'package:flutter/material.dart';
import 'dart:math';

class Shape extends CustomPainter {
  double x = 0; // 한 변의 길이
  Shape({this.side}); // 생성자
  int side; // 변의 개수
  double xCenter, yCenter; // 중심의 위치
  double step; // 각도 계산
  @override
  void paint(Canvas canvas, Size size) {
    init(size);
    drawShape(canvas);
    drawShape(
      canvas,
      inner: true,
    );
    drawLine(canvas);
  }

  void drawShape(Canvas canvas, {bool inner = false}) {
    var paint = Paint();
    paint.color = inner ? Colors.black : Colors.grey[300];
    paint.strokeWidth = 1;
    paint.style =
        inner ? PaintingStyle.stroke : PaintingStyle.fill; // fill 채우기 ,
    var path = Path();
    // 시작 점
    path.moveTo(xCenter, yCenter - x); // (0, y)
    for (int i = 0; i < side; i++) {
      // 1부터 반복해도 됨 (이미 위에서 좌표를 정해줬기 때문 )
      // 각도를 계산하여 선을 이어줌
      path.lineTo(xCenter + x * sin(i * step), yCenter - x * cos(i * step));
    }

    path.close(); // path를 닫아 마지막 연결
    canvas.drawPath(path, paint);
  }

  void drawLine(Canvas canvas) {
    var paintLine = Paint();
    paintLine.color = Color.fromARGB(100, 100, 100, 100);
    paintLine.strokeWidth = 0.5;
    paintLine.style = PaintingStyle.stroke;
    var pathLine = Path();
    for (int i = 0; i < side; i++) {
      // 중앙에서 시작
      pathLine.moveTo(xCenter, yCenter);
      // 각 꼭지점으로 선 긋기
      pathLine.lineTo(xCenter + x * sin(i * step), yCenter - x * cos(i * step));
    }
    canvas.drawPath(pathLine, paintLine);

    canvas.drawLine(
        Offset(xCenter, 0),
        Offset(xCenter, yCenter * 2),
        Paint()
          ..color = Colors.black45
          ..strokeWidth = 2);
    canvas.drawLine(
        Offset(0, yCenter),
        Offset(xCenter * 2, yCenter),
        Paint()
          ..color = Colors.black45
          ..strokeWidth = 2);
  }

  void init(Size size) {
    xCenter = size.width / 2; // x 가운데 위치
    yCenter = size.height / 2; // y 가운데 위치
    x = size.width / 2.7; // 한 변의 길이
    step = 2 * pi / (side);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
