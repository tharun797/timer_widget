import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/components/set_timer_row.dart';
import 'package:timer_app/model/database.dart'; 

class SetTimer extends StatelessWidget {
  const SetTimer({super.key});

   

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'How long?',
            style: GoogleFonts.poppins(
                color: Colors.white, fontSize: 20, letterSpacing: 3),
          ),
          const SizedBox(
            height: 15,
          ),
          const SetTimerRow(),
          NumericKeyboard(
            onKeyboardTap: (val) {
              dataBase.setTimer(int.parse(val));
            },
            textStyle: GoogleFonts.poppins(fontSize: 25.0, color: Colors.white),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            rightIcon: const Icon(
              Icons.backspace_outlined,
              color: Colors.white,
              size: 25,
            ),
            rightButtonFn: () {
              dataBase.deleteTimer();
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
