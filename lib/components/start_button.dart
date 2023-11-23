import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/model/database.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      int duration = dataBase.duration;
      return GestureDetector(
        onTap: () {
          if (dataBase.showSetTimer) {
            dataBase.setShowTimer = false;
            dataBase.onUpdateDuration();
            if (dataBase.sec != 0 || dataBase.min != 0 || dataBase.hr != 0) {
              dataBase.resetDuration();
            }
          } else {
            if (duration != 0) {
              dataBase.startTimer();
            }
          }
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: kSecondaryColour, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Icon(
              dataBase.showSetTimer
                  ? Icons.check_rounded
                  : dataBase.countdownController.isStarted
                      ? dataBase.countdownController.isResumed
                          ? Icons.pause
                          : (dataBase.countdownController.isPaused
                              ? Icons.play_arrow_rounded
                              : Icons.pause)
                      : Icons.play_arrow_rounded,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      );
    });
  }
}
