import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/model/database.dart';

class HourGlassWidget extends StatelessWidget {
  const HourGlassWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      return GestureDetector(
        onTap: () {
          if (!dataBase.countdownController.isStarted) {
            dataBase.toggleShowSetTimer();
          }
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: dataBase.showSetTimer
              ? const Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 30,
                )
              : const Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 12,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
