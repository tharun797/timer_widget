import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/components/count_down_timer_stack.dart';
import 'package:timer_app/components/delete_button.dart';
import 'package:timer_app/components/hour_glass_widget.dart';
import 'package:timer_app/components/set_timer.dart';
import 'package:timer_app/components/start_button.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/model/database.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      return Scaffold(
        backgroundColor: kPrimaryColour,
        appBar: AppBar(
          backgroundColor: kPrimaryColour,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 7.5, right: 7.5, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Timer',
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 35, letterSpacing: 5),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: dataBase.showSetTimer
                        ? const SetTimer()
                        : const CountDownTimerStack(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DeleteButton(
                        onTap: () {
                          if (dataBase.showSetTimer) {
                            dataBase.resetDuration();
                          } else {
                            dataBase.onUpdateDuration();
                          }
                        },
                      ),
                      StartButton(),
                      const HourGlassWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
