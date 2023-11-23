import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_app/constants.dart';
import 'package:timer_app/model/database.dart';

class SetTimerRow extends StatelessWidget {
  const SetTimerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBase>(builder: (context, dataBase, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  dataBase.setIsSecSelected = false;
                  dataBase.setIsMinSelected = false;
                  dataBase.setIsHrSelected = true;
                },
                child: Text(
                  dataBase.hr.toString().padLeft(2, '0'),
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: !dataBase.isHrselected &&
                              !dataBase.isMinSelected &&
                              !dataBase.isSecselected
                          ? kSecondaryColour
                          : dataBase.isHrselected
                              ? kSecondaryColour
                              : Colors.white,
                      letterSpacing: 5),
                ),
              ),
              SizedBox(
                width: 55,
                child: Center(
                  child: Text(
                    'Hours',
                    style: kSetTimerTextstyle,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            ':',
            style: GoogleFonts.poppins(fontSize: 30, color: kSecondaryColour),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  dataBase.setIsSecSelected = false;
                  dataBase.setIsMinSelected = true;
                  dataBase.setIsHrSelected = false;
                },
                child: Text(
                  dataBase.min.toString().padLeft(2, '0'),
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: !dataBase.isHrselected &&
                              !dataBase.isMinSelected &&
                              !dataBase.isSecselected
                          ? kSecondaryColour
                          : dataBase.isMinSelected
                              ? kSecondaryColour
                              : Colors.white,
                      letterSpacing: 5),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SizedBox(
                  width: 55,
                  child:
                      Center(child: Text('Minutes', style: kSetTimerTextstyle)))
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            ':',
            style: GoogleFonts.poppins(fontSize: 30, color: kSecondaryColour),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  dataBase.setIsSecSelected = true;
                  dataBase.setIsMinSelected = false;
                  dataBase.setIsHrSelected = false;
                },
                child: Text(
                  dataBase.sec.toString().padLeft(2, '0'),
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: !dataBase.isHrselected &&
                              !dataBase.isMinSelected &&
                              !dataBase.isSecselected
                          ? kSecondaryColour
                          : dataBase.isSecselected
                              ? kSecondaryColour
                              : Colors.white,
                      letterSpacing: 5),
                ),
              ),
              SizedBox(
                width: 55,
                child: Center(
                  child: Text(
                    'Seconds',
                    style: kSetTimerTextstyle,
                  ),
                ),
              )
            ],
          )
        ],
      );
    });
  }
}
