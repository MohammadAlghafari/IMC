import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/common_models/InterventionHistoryModel.dart';

import 'package:imc/InterventionDetails/data/repositories/CustomerInterventionsHistoryRepo.dart';
import 'package:meta/meta.dart';
import 'package:open_file/open_file.dart';

part 'customer_interventions_history_cubit_state.dart';

class CustomerInterventionsHistoryCubit extends Cubit<CustomerInterventionsHistoryState> {
  final CustomerInterventionsHistoryRepo _customerInterventionsHistoryRepo;
  CustomerInterventionsHistoryCubit(this._customerInterventionsHistoryRepo) : super(CustomerInterventionsHistoryInitial());
  List<Records?>? _listOfRecords ;
  /// [getCustomerInterventionsHistory] will return all the interventions history for the passed interventionId
  Future<void> getCustomerInterventionsHistory({required int interventionId}) async {
    try {
      emit(CustomerInterventionsHistoryLoading());
      _listOfRecords = await _customerInterventionsHistoryRepo.getCustomerInterventionHistory(interventionId);
      emit(CustomerInterventionsHistoryLoaded(interventionsHistorires: _listOfRecords));
    } catch (e) {
      log("customer_intervention_history_cubit_error: $e");
      emit(CustomerInterventionsHistoryError("${e}"));
    }
  }

  ///[downloadPdf] will download the intervention pdf from the server
  Future<void> downloadPdf({required url, required savePath}) async {
    emit(PDFDownloading());
    try {
      await _customerInterventionsHistoryRepo.downloadPdf(url: url, savePath: savePath);
      OpenFile.open(savePath);
      emit(CustomerInterventionsHistoryLoaded(interventionsHistorires: _listOfRecords));
    } catch (e) {
      emit(CustomerInterventionsHistoryError("$e"));
    }
  }

  void resetCubit(){
    emit(CustomerInterventionsHistoryInitial());
    _listOfRecords = null;
  }
}