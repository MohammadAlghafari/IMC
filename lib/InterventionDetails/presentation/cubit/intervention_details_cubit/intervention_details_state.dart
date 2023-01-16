part of 'intervention_details_cubit.dart';

@immutable
abstract class InterventionDetailsState {
  const InterventionDetailsState();
}

class InterventionDetailsInitial extends InterventionDetailsState {
  const InterventionDetailsInitial();
}

class InterventionDetailsLoading extends InterventionDetailsState {
  const InterventionDetailsLoading();
}

class InterventionDetailsLoaded extends InterventionDetailsState {
  final InterventionDetailsModel interventionDetails;
  const InterventionDetailsLoaded(this.interventionDetails);
}

// state for uploading files
class InterventionDetailsUploading extends InterventionDetailsState {
  const InterventionDetailsUploading();
}

// state when files are uploaded
class InterventionDetailsUploaded extends InterventionDetailsState {
  final File? pdfFile;
  final bool? isUploadedSuccessfully;
  const InterventionDetailsUploaded({this.pdfFile, this.isUploadedSuccessfully});
}

class InterventionDetailsError extends InterventionDetailsState {
  final String errorMessage;
  const InterventionDetailsError(this.errorMessage);
}