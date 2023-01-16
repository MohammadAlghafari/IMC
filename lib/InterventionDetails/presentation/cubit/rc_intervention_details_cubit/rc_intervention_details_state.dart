part of 'rc_intervention_details_cubit.dart';

@immutable
abstract class RCInterventionDetailsState {
  const RCInterventionDetailsState();
}

class RCInterventionDetailsInitial extends RCInterventionDetailsState {
  const RCInterventionDetailsInitial();
}

class RCInterventionDetailsLoading extends RCInterventionDetailsState {
  const RCInterventionDetailsLoading();
}

class RCInterventionDetailsLoaded extends RCInterventionDetailsState {
  final RCInterventionDetailsModel rcInterventionDetails;
  const RCInterventionDetailsLoaded(this.rcInterventionDetails);
}

class RCInterventionDetailsUploading extends RCInterventionDetailsState {
  const RCInterventionDetailsUploading();
}

class RCInterventionDetailsUploaded extends RCInterventionDetailsState {
  final File? pdfFile;
  final bool? isUploadedSuccessfully;
  const RCInterventionDetailsUploaded({this.pdfFile, this.isUploadedSuccessfully});
}

class RCInterventionDetailsError extends RCInterventionDetailsState {
  final String errorMessage;
  const RCInterventionDetailsError(this.errorMessage);
}