import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class DataBase extends ChangeNotifier {
  final CountDownController countdownController = CountDownController();

  int sec = 0;

  int min = 0;

  int hr = 0;

  bool showSetTimer = false;

  void toggleShowSetTimer() {
    showSetTimer = !showSetTimer;
    notifyListeners();
  }

  void startTimer() {
    if (!countdownController.isStarted) {
      countdownController.start();
    } else {
      if (countdownController.isPaused) {
        countdownController.resume();
      } else {
        countdownController.pause();
      }
    }
    notifyListeners();
  }

  void resetTimer() {
    countdownController.reset();
    notifyListeners();
  }

  set setShowTimer(bool value) {
    showSetTimer = value;
    notifyListeners();
  }

  bool isSecselected = false;
  bool isMinSelected = false;
  bool isHrselected = false;

  void resetDuration() {
    sec = 0;
    min = 0;
    hr = 0;
    isSecselected = false;
    isMinSelected = false;
    isHrselected = false;
    notifyListeners();
  }

  set setIsSecSelected(bool value) {
    isSecselected = value;
    notifyListeners();
  }

  set setIsMinSelected(bool value) {
    isMinSelected = value;
    notifyListeners();
  }

  set setIsHrSelected(bool value) {
    isHrselected = value;
    notifyListeners();
  }

  void setTimer(int val) {
    if (!isSecselected && !isMinSelected && !isHrselected) {
      if (hr <= 9) {
        sec = sec * 10 + val;

        if (sec > 99 || min > 0 && sec >= 0) {
          if (min <= 99) {
            min = min * 10 + sec ~/ 10 ~/ 10;
            sec = sec % 100;
          }
        }
        if (min > 99 || hr > 0 && min >= 0) {
          hr = hr * 10 + min ~/ 10 ~/ 10;
          min = min % 100; //
        }
      }
    } else {
      if (isSecselected & !isMinSelected & !isHrselected && sec <= 9) {
        sec = sec * 10 + val;
      } else if (!isSecselected & isMinSelected & !isHrselected && min <= 9) {
        min = min * 10 + val;
      } else if (!isSecselected & !isMinSelected & isHrselected && hr <= 9) {
        hr = hr * 10 + val;
      }
    }

    notifyListeners();
  }

  void deleteTimer() {
    if (!isHrselected && !isMinSelected && !isSecselected) {
      if (hr > 0) {
        hr = hr ~/ 10;
      } else if (min > 0) {
        min = min ~/ 10;
      } else if (sec > 0) {
        sec = sec ~/ 10;
      }
    } else {
      if (isSecselected && sec > 0) {
        sec = sec ~/ 10;
      } else if (isMinSelected && min > 0) {
        min = min ~/ 10;
      } else if (isHrselected && hr > 0) {
        hr = hr ~/ 10;
      }
      if (sec == 0 && min == 0 && hr == 0) {
        isSecselected = false;
        isHrselected = false;
        isMinSelected = false;
      }
    }

    notifyListeners();
  }

  int duration = 0;

  void onUpdateDuration() {
    duration = hr * 3600 + min * 60 + sec;

    notifyListeners();
  }
}
