import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/components/count_down_timer.dart';
import 'package:timer_app/components/reset_button.dart';
import 'package:timer_app/model/database.dart';

class CountDownTimerStack extends StatelessWidget {
  const CountDownTimerStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      DateTime currentTime = DateTime.now();
      DateTime newTime = currentTime.add(Duration(
        seconds: dataBase.duration,
      ));
      String formattedNewTime = DateFormat('hh:mm a').format(newTime);
      return Stack(
        alignment: Alignment.center,
        children: [
          CountDownTimer(
            sec: dataBase.duration,
            countDownController: dataBase.countdownController,
            onComplete: () {
              dataBase.resetTimer();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: TextSpan(
                      style: GoogleFonts.poppins(
                          color: Colors.white54, fontSize: 15),
                      children: [
                        const WidgetSpan(
                            child: Padding(
                          padding: EdgeInsets.only(right: 4, bottom: 3.5),
                          child: Icon(
                            Icons.notifications_active,
                            color: Colors.white70,
                            size: 15,
                          ),
                        )),
                        TextSpan(
                          text: formattedNewTime,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: dataBase.countdownController.isPaused
                        ? ResetButton(onTap: () {
                            dataBase.resetTimer();
                          })
                        : const SizedBox(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
