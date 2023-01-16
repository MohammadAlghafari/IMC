import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class TeamLeaderHiveKeys {
  static String teamLeaderInterventionStartTime = "startTime";
  static String teamLeaderLatitude = "latitude";
  static String teamLeaderLongitude = "longitude";
}

class TeamLeaderHiveHelper {
  static final _hiveBox = GetIt.I<Box>();

  // For saving intervention start time
  static void saveInterventionStartTime(String? interventionStartTime) {
    _hiveBox.put(TeamLeaderHiveKeys.teamLeaderInterventionStartTime, interventionStartTime);
  }

  // For saving latitude value
  static void saveLatitude(String? latitude) {
    _hiveBox.put(TeamLeaderHiveKeys.teamLeaderLatitude, latitude);
  }

  // For saving longitude value
  static void saveLongitude(String? longitude) {
    _hiveBox.put(TeamLeaderHiveKeys.teamLeaderLongitude, longitude);
  }

  //getting the stored value from Hive
  static String? get getInterventionStartTime => _hiveBox.get(TeamLeaderHiveKeys.teamLeaderInterventionStartTime);
  static String? get getLatitude => _hiveBox.get(TeamLeaderHiveKeys.teamLeaderLatitude);
  static String? get getLongitude => _hiveBox.get(TeamLeaderHiveKeys.teamLeaderLongitude);
}