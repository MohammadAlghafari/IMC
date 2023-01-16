import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserHiveHelper {
  static final _hiveBox = GetIt.I<Box>();

  // This is the key for storing timePassed
  static String _timeKey = "TimeKey";

  // This key is for storing is timer active or not
  static String _isTimerActiveKey = "isTimerActiveKey";

  // For saving the time passed after activating break time
  static void saveBreakTimePassed(int? secondsPassed) {
    _hiveBox.put(_timeKey, secondsPassed);
  }

  // For saving timer status (acitve/not active)
  static void setIsTimerActive(bool? value) {
    _hiveBox.put(_isTimerActiveKey, value);
  }

  static int? get getBreakTimePassed => _hiveBox.get(_timeKey);
  static bool get getIsTimerActive => _hiveBox.get(_isTimerActiveKey, defaultValue: false);

}