// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unnecessary_string_escapes

import 'dart:async';
import 'package:dyslexia/pages/level1/round_2/Q8sound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import 'package:audioplayers/audioplayers.dart';

import '../../../utilities/QuestionWidget.dart';
import 'package:dyslexia/pages/data/DataModel.dart';

DataModel data = DataModel();
DataModel returndata() {
  return data;
}

class Q7sound extends StatefulWidget {
  const Q7sound({Key? key}) : super(key: key);

  @override
  State<Q7sound> createState() => _Q7soundState();
}

class _Q7soundState extends State<Q7sound> {
  String question =
      "Listen to this letter sound and then choose the letter whose sound you hear";

  var changeButton = false;

  bool changecolourC = false;
  bool changecolourW1 = false;
  bool changecolourW2 = false;
  bool changecolourW3 = false;

  double elev = 10;
  bool changeColor = false;
  String letter = "p";
  bool buttonPressed1 = false;
  bool isPlayingMsg = false;
  var istap = false;

  int clicksPerpage = 0;
  int correctAns = 0;
  int incorrectAns = 0;
  int timeFirstClick = 0;
  num duration = 0;
  List timeIntervalClicks = [];

  int timer = 0;
  bool canceltimer = false;

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

  AudioPlayer player = AudioPlayer();

  num countDuration() {
    for (int i = 0; i < timeIntervalClicks.length; i++) {
      duration = duration + timeIntervalClicks[i];
    }
    return duration;
  }

  @override
  Widget build(BuildContext context) {
    bool isPlayingMsg = false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.cyan,
        title: Text("AD&DY"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          QuestionWidget(question: question),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),

          //audio button

          Material(
            elevation: 5,
            color: Colors.cyan[50],
            child: ListTile(
              onTap: () async {
                player.setVolume(200);
                player.play(AssetSource("/sound/p.mp3"));
                isPlayingMsg = true;
                clicksPerpage += 1;
                timeFirstClick = timer.toInt();
                timeIntervalClicks.add(timer.toInt());
                if (mounted) {
                  setState(() {
                    timer = 0;
                  });
                }
              },
              leading: Icon(isPlayingMsg ? Icons.stop : Icons.play_arrow),
              title: Text(isPlayingMsg ? "Stop" : "Play",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),

          Divider(
            thickness: 1.0,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW1 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;

                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW1 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("M",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourC ? Colors.green : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    correctAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourC = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                    istap = true;
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("P",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW2 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());
                    if (mounted) {
                      setState(() {
                        changecolourW2 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("R",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
              Material(
                elevation: elev,
                shadowColor: Colors.grey,
                color: changecolourW3 ? Colors.red : Colors.cyan,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () {
                    clicksPerpage += 1;
                    incorrectAns += 1;
                    timeIntervalClicks.add(timer.toInt());

                    if (mounted) {
                      setState(() {
                        changecolourW3 = true;
                        elev = 0;
                        timer = 0;
                      });
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: Text("S",
                          textScaleFactor: 1.2,
                          style: TextStyle(
                            color: Colors.black,
                          ))),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
            child: InkWell(
              onTap: () {
                data.updateData(clicksPerpage, correctAns, incorrectAns,
                    timeFirstClick, countDuration(), timeIntervalClicks);
                Duration(seconds: 4);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Q8sound()));
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
        ]),
      ),
    );
  }
}
