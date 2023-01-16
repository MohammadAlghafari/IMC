import 'package:imc/common_models/intervention_record_model.dart';

abstract class InterventionRepository{

  ///[getListOfTechnicianInterventionByDateRange] will return the list of intervention of a technician for a particular date range
  Future<List<Records>?> getListOfTechnicianInterventionByDateRange(String startDate, String endDate);

  ///[getInterventionListOnMaps] will return the list of intervention of a technician on a map for a today
  Future<List<Records>?> getInterventionListOnMaps();

}