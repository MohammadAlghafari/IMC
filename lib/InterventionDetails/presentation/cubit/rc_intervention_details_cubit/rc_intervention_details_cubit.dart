import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/repositories/InterventionDetailsRepository.dart';

part 'rc_intervention_details_state.dart';

class RCInterventionDetailsCubit extends Cubit<RCInterventionDetailsState> {
  // injecting InterventionDetailsRepository;
  InterventionDetailsRepository _interventionDetailsRepository;
  // creating a constructor with the repository
  RCInterventionDetailsCubit(this._interventionDetailsRepository) : super(RCInterventionDetailsInitial()) {
    // as soon as the cubit is initialized we want to change state to loaded
    RCInterventionDetailsModel _rcInterventionDetails = _interventionDetailsRepository.getRCInterventionDetails;
    //this is added to display one image container;
    // var newDetails = _rcInterventionDetails.copyWith(
    //   photosOfAction: [""],
    // );
    // emit(RCInterventionDetailsLoaded(newDetails));
  }

  /// The function [saveRCInterventionDetailsInBloc] saves the data coming from the user
  /// into the bloc and emits it.
  Future<void> saveRCInterventionDetailsInBloc(RCInterventionDetailsModel rcInterventionDetails) async {
    _interventionDetailsRepository.setRcInterventionDetails(rcInterventionDetails);
    emit(RCInterventionDetailsLoaded(rcInterventionDetails));
  }

  ///[endRCIntervention] will end the techincian's RC case intervention and uploads the pdf to the server
  Future<void> endRCIntervention(
      File file, {
        required String fileName,
        required int interventionId,
        required int interventionStatus,
        required RCInterventionDetailsModel rcIntervention,
      }) async {
    emit(RCInterventionDetailsUploading());
    try {
      // bool result = await _interventionDetailsRepository.uploadFile(file, fileName: fileName, interventionId: interventionId);
      final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();

      //deleting from database
      _interventionDetailsDatabase.deleteRCInterventionDetails(interventionId);

      // ending the intervention, uploading pdf and updating status
       await  _interventionDetailsRepository.endIntervention(
          file: file,
          fileName: fileName,
          latitude: rcIntervention.latitude.toString(),
          longitude: rcIntervention.longitude.toString(),
          interventionId: interventionId,
          rcIntervention: rcIntervention,
          startDateTime: rcIntervention.startTimeOfIntervention!,
          endDateTime: rcIntervention.endTimeOfIntervention!,
         interventionStatus: interventionStatus,
        );

      ///emitting the uploaded state after intervention is ended with pdf uploaded
      emit(RCInterventionDetailsUploaded(pdfFile: file, isUploadedSuccessfully: true));
    } catch (e) {
      emit(RCInterventionDetailsError("$e"));
    }
  }

  void changePageState(RCInterventionDetailsState state) {
    emit(state);
  }
}