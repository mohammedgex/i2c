import 'dart:async';
import 'package:get/get.dart';

class CountdownController extends GetxController {
  var hours = 0.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  Timer? _timer;

  // Function to initialize time from minutes input
  void setTimeFromMinutes(int totalMinutes) {
    hours.value = totalMinutes ~/ 60; // Get Hours
    minutes.value = totalMinutes % 60; // Get Remaining Minutes
    seconds.value = 0; // Start from 0 seconds
    startCountdown(); // Automatically start countdown
  }

  void startCountdown() {
    stopCountdown(); // Stops any existing timer before starting a new one
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (hours.value == 0 && minutes.value == 0 && seconds.value == 0) {
        timer.cancel();
      } else {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          if (minutes.value > 0) {
            minutes.value--;
            seconds.value = 59;
          } else if (hours.value > 0) {
            hours.value--;
            minutes.value = 59;
            seconds.value = 59;
          }
        }
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
  }

  void resetCountdown(int totalMinutes) {
    stopCountdown();
    setTimeFromMinutes(totalMinutes); // Reset with new time
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
