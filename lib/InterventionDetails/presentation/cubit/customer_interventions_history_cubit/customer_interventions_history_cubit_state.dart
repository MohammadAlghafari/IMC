part of 'customer_interventions_history_cubit_cubit.dart';

@immutable
abstract class CustomerInterventionsHistoryState {
  const CustomerInterventionsHistoryState();
}

class CustomerInterventionsHistoryInitial extends CustomerInterventionsHistoryState {}

class CustomerInterventionsHistoryLoading extends CustomerInterventionsHistoryState {}

class PDFDownloading extends CustomerInterventionsHistoryState{

}
class PDFDownloaded extends CustomerInterventionsHistoryState{}

class CustomerInterventionsHistoryLoaded extends CustomerInterventionsHistoryState {
  final List<Records?>? interventionsHistorires;
  const CustomerInterventionsHistoryLoaded({required this.interventionsHistorires});
}

class CustomerInterventionsHistoryError extends CustomerInterventionsHistoryState {
  final String errorMessage;
  const CustomerInterventionsHistoryError(this.errorMessage);
}