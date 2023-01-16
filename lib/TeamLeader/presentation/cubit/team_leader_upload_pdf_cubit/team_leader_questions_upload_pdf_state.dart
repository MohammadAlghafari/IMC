part of 'team_leader_questions_upload_pdf_cubit.dart';

@immutable
abstract class TeamLeaderQuestionsUploadPdfState {}

class TeamLeaderQuestionsUploadPdfInitial extends TeamLeaderQuestionsUploadPdfState {}

class TeamLeaderQuestionsUploadPdfUploading extends TeamLeaderQuestionsUploadPdfState {}

class TeamLeaderQuestionsUploadPdfUploaded extends TeamLeaderQuestionsUploadPdfState {
  final File pdf;
  final bool isUploadedSuccessfully;

  TeamLeaderQuestionsUploadPdfUploaded(this.pdf, this.isUploadedSuccessfully);
}

class TeamLeaderQuestionsUploadPdfError extends TeamLeaderQuestionsUploadPdfState {
  final String errorMessage;
  TeamLeaderQuestionsUploadPdfError(this.errorMessage);
}