import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';

part 'team_leader_questions_upload_pdf_state.dart';

class TeamLeaderQuestionsUploadPdfCubit extends Cubit<TeamLeaderQuestionsUploadPdfState> {
  TeamLeaderRepository _teamLeaderRepository;

  TeamLeaderQuestionsUploadPdfCubit(this._teamLeaderRepository) : super(TeamLeaderQuestionsUploadPdfInitial());

  /// [endTeamLeaderVisit] function will end the intervention and will upload the pdf to the server
  Future<void> endTeamLeaderVisit({
    required int clientId,
    required int visitId,
    required String schedule,
    required String starDateTime,
    required String endDateTime,
    required String latitude,
    required String longitude,
    required File pdfFile,
    required String pdfName,
  }) async {
    emit(TeamLeaderQuestionsUploadPdfUploading());
    try {
      bool result = await _teamLeaderRepository.endTeamLeaderVisit(
        clientId: clientId,
        visitId: visitId,
        schedule: schedule,
        startDate: endDateTime,
        endDate: starDateTime,
        latitude: latitude,
        longitude: longitude,
        pdfFile: pdfFile,
        pdfName: pdfName,
      );
      emit(TeamLeaderQuestionsUploadPdfUploaded(pdfFile, result));
    } catch (e) {
      emit(TeamLeaderQuestionsUploadPdfError("$e"));
    }
  }

  void resetCubit(){
    emit(TeamLeaderQuestionsUploadPdfInitial());
  }
}