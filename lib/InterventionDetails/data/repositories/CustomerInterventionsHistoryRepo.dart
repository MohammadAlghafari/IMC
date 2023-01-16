import 'package:imc/common_models/InterventionHistoryModel.dart';

abstract class CustomerInterventionsHistoryRepo {

  /// This function [getCustomerInterventionHistory] will return all the interventions for the given [interventonid]
  Future<List<Records?>?> getCustomerInterventionHistory(int interventionId);

  /// This function [downloadPdf] will download the intervention PDF from the server.
  Future downloadPdf({required url, required savePath});
}