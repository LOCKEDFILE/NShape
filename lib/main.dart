import 'package:flutter/material.dart';
import 'shape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'N Shape',
      home: NShape(),
    );
  }
}

class NShape extends StatefulWidget {
  @override
  _NShapeState createState() => _NShapeState();
}

class _NShapeState extends State<NShape> {
  TextEditingController controller;
  FocusNode focus;
  int side;
  @override
  void initState() {
    controller = TextEditingController();
    focus = FocusNode();
    side = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('정N각형'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            children: <Widget>[
              drawShape(side: side),
              Container(
                margin: EdgeInsets.all(32),
                child: TextField(
                  controller: controller,
                  focusNode: focus,
                  autofocus: true,
                  onSubmitted: (v) {
                    setState(() {
                      if (int.parse(v) > 2) side = int.parse(v);
                      controller.clear();
                      focus.requestFocus();
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '정 N 각형',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawShape({int side}) {
    return Container(
      margin: EdgeInsets.all(32),
      width: 300,
      height: 300,
      child: nShape(side: side),
    );
  }

  Widget nShape({int side}) {
    return CustomPaint(
      painter: Shape(side: side),
      child: Text(
        '정 $side 각형',
        style: TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
