import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:timer_app/constants.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer(
      {super.key,
      required this.sec,
      required this.countDownController,
      required this.onComplete});

  final int sec;
  final CountDownController countDownController;
  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: sec,
      controller: countDownController,
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      ringColor: Colors.white70,
      fillColor: kSecondaryColour,
      backgroundColor: Colors.black,
      strokeWidth: 4.0,
      strokeCap: StrokeCap.round,
      textStyle:
          const TextStyle(fontSize: 30, color: Colors.white, letterSpacing: 8),
      isReverse: true,
      isReverseAnimation: true,
      autoStart: false,
      onComplete: () => onComplete(),
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        int hours = duration.inHours;
        int minutes = (duration.inMinutes % 60);
        int seconds = (duration.inSeconds % 60);
        if (duration.inSeconds >= 0) {
          return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
