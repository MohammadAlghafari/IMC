import 'package:imc/base_screen/data/models/break_time_model.dart';

abstract class BreakTimeRepository {

  /// [startBreakTimer] will start the break timer for the technician
  Future<BreakTimeModel> startBreakTimer();

  /// [resumeWork] will stop the break timer and the technician and resumeWorking.
  Future<BreakTimeModel> resumeWork();

}