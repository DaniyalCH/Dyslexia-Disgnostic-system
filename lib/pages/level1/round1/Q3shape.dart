// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../../../utilities/QuestionWidget.dart';
import 'Q4shape.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q3Shape extends StatefulWidget {
  const Q3Shape({Key? key}) : super(key: key);

  @override
  State<Q3Shape> createState() => _Q3ShapeState();
}

class _Q3ShapeState extends State<Q3Shape> {
  String question = "Match the shape that you can see with the given options";
  var changeButton = false;

  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;

  bool showImage = false;
  double elev = 12;
  bool showoptions = false;
  bool showquestion = true;
  var tap_count = 0;
  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];
  int timer = 0;
  bool canceltimer = false;
  String showtimer = "30";

  num countDuration() {
    for (int i = 0; i < timeIntervalClicks.length; i++) {
      duration = duration + timeIntervalClicks[i];
    }
    return duration;
  }

  void mappData() {
    data.clicksPerpage = clicksPerpage;
    data.correctAns = correctAns;
    data.incorrectAns = incorrectAns;
    data.timeFirstClick = timeFirstClick;
    data.timeIntervalClicks = timeIntervalClicks;
    data.duration = countDuration();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      if (mounted) {
        setState(() {
          timer = timer + 1;
        });
      }
    });
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: Text("AD&DY"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(14.0),
          // ignore: prefer_const_literals_to_create_immutables
          child: SingleChildScrollView(
              child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                TablerIcons.circle_check,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_check,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                color: Colors.cyan,
                size: 30,
              ),
              Icon(
                changecolourC
                    ? TablerIcons.circle_check
                    : changecolourW1
                        ? TablerIcons.circle_check
                        : changecolourW2
                            ? TablerIcons.circle_check
                            : changecolourW3
                                ? TablerIcons.circle_check
                                : TablerIcons.circle_dashed,
                size: 30,
                color: changecolourC
                    ? Colors.green
                    : changecolourW1
                        ? Colors.red
                        : changecolourW2
                            ? Colors.red
                            : changecolourW3
                                ? Colors.red
                                : Colors.black,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.line_dashed,
                size: 30,
              ),
              Icon(
                TablerIcons.circle_dashed,
                size: 30,
              ),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            showquestion
                ? Column(
                    children: [
                      QuestionWidget(question: question),
                      const SizedBox(
                        height: 20,
                      ),
                      showImage
                          ? Column(
                              children: [
                                CustomPaint(
                                  size: Size(200, 150),
                                  painter: RPSCustomPainterQ(),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      ElevatedButton(
                          onPressed: () {
                            clicksPerpage += 1;
                            timeFirstClick = timer.toInt();

                            timeIntervalClicks.add(timer.toInt());
                            if (mounted) {
                              setState(() {
                                timer = 0;
                              });
                            }

                            Timer(Duration(seconds: 0), () {
                              if (mounted) {
                                setState(() {
                                  showImage = true;
                                });
                              }
                            });
                            Timer(Duration(seconds: 5), () {
                              if (mounted) {
                                setState(() {
                                  showImage = false;
                                  showquestion = false;
                                  showoptions = true;
                                });
                              }
                            });
                          },
                          child: Text('show image')),
                    ],
                  )
                : SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            showoptions
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW1 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                changecolourW1 = true;
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;

                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO1(),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourC ? Colors.green[200] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                correctAns += 1;

                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourC = true;

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterQ(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW2 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;

                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourW2 = true;

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO2(),
                                ),
                              ),
                            ),
                          ),
                          Material(
                            elevation: elev,
                            shadowColor: Colors.grey,
                            color:
                                changecolourW3 ? Colors.red[100] : Colors.cyan,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8),
                            child: InkWell(
                              onTap: () {
                                clicksPerpage += 1;
                                timeFirstClick = timer.toInt();
                                incorrectAns += 1;

                                timeIntervalClicks.add(timer.toInt());
                                if (mounted) {
                                  setState(() {
                                    timer = 0;
                                  });
                                }
                                changecolourW3 = true;

                                elev = 0;
                              },
                              child: Container(
                                height: 120,
                                width: 180,
                                alignment: Alignment.topLeft,
                                child: CustomPaint(
                                  size: Size(size.width, size.height),
                                  painter: RPSCustomPainterO3(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Material(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () {
                            data.updateData(
                                clicksPerpage,
                                correctAns,
                                incorrectAns,
                                timeFirstClick,
                                countDuration(),
                                timeIntervalClicks);
                            Duration(seconds: 4);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Q4Shape()));
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 4),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.black,
                                  )
                                : Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ]))),
    );
  }
}

class RPSCustomPainterQ extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5008250, size.height * 0.2967200);
    path0.quadraticBezierTo(size.width * 0.3200375, size.height * 0.2960800,
        size.width * 0.3129125, size.height * 0.6006200);
    path0.lineTo(size.width * 0.6873750, size.height * 0.5980000);
    path0.quadraticBezierTo(size.width * 0.6882000, size.height * 0.2935000,
        size.width * 0.5008250, size.height * 0.2967200);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3934750, size.height * 0.4920600);
    path0.quadraticBezierTo(size.width * 0.4024750, size.height * 0.2407200,
        size.width * 0.6237750, size.height * 0.2423600);
    path0.lineTo(size.width * 0.6234625, size.height * 0.7587800);
    path0.quadraticBezierTo(size.width * 0.4017000, size.height * 0.7730400,
        size.width * 0.3934750, size.height * 0.4920600);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.6246875, size.height * 0.4970600);
    path0.quadraticBezierTo(size.width * 0.6221875, size.height * 0.2555000,
        size.width * 0.3749500, size.height * 0.2639200);
    path0.lineTo(size.width * 0.3737125, size.height * 0.7354800);
    path0.quadraticBezierTo(size.width * 0.6255875, size.height * 0.7479600,
        size.width * 0.6246875, size.height * 0.4970600);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainterO3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4987500, size.height * 0.7000000);
    path0.quadraticBezierTo(size.width * 0.3179625, size.height * 0.6993600,
        size.width * 0.3118750, size.height * 0.3990000);
    path0.lineTo(size.width * 0.6875000, size.height * 0.3980000);
    path0.quadraticBezierTo(size.width * 0.6861250, size.height * 0.6967800,
        size.width * 0.4987500, size.height * 0.7000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
