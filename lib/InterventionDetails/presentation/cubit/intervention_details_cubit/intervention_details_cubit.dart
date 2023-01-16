import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imc/InterventionDetails/data/local_database/normal_intervention_local_database/intervention_details_drift_helper.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/repositories/InterventionDetailsRepository.dart';

part 'intervention_details_state.dart';

class InterventionDetailsCubit extends Cubit<InterventionDetailsState> {
  // injecting InterventionDetailsRepository;
  InterventionDetailsRepository _interventionDetailsRepository;
  // creating a constructor with the repository
  InterventionDetailsCubit(this._interventionDetailsRepository) : super(InterventionDetailsInitial()) {
    // as soon as the cubit is initialized we want to change state to loaded
    InterventionDetailsModel _interventionDetails = _interventionDetailsRepository.getInterventionDetails;
    // this is added to display one image container;
    var newDetails = _interventionDetails.copyWith(photoOfIndexImage: [""], enterAdditionallyMaterial: [""], photosOfNewMeterInstalled: [""]);
    emit(InterventionDetailsLoaded(newDetails));
  }

  /// The function [saveInterventionDetailsInBloc] saves the data coming from the user
  /// into the bloc and emits it.
  Future<void> saveInterventionDetailsInBloc(InterventionDetailsModel interventionDetails) async {
    _interventionDetailsRepository.setInterventionDetails(interventionDetails);
    emit(InterventionDetailsLoaded(interventionDetails));
  }

  InterventionDetailsModel get getInterventionDetails => _interventionDetailsRepository.getInterventionDetails;

  /// [endIntervention]will end the technician intervention and also uploads the pdf to the server
  Future<void> endIntervention(
      File file, {
        required String fileName,
        required int interventionId,
        required int interventionStatus,
        required InterventionDetailsModel normalInterventionDetails,
      }) async {
    emit(InterventionDetailsUploading());
    try {
      // bool result = await _interventionDetailsRepository.uploadFile(file, fileName: fileName, interventionId: interventionId);
      final _interventionDetailsDatabase = GetIt.I<InterventionDetailsDatabase>();

      // deleting from database
      _interventionDetailsDatabase.deleteFromLocalDB(interventionId);



      // ending the intervention, uploading pdf and updating status
      await _interventionDetailsRepository.endIntervention(
          file: file,
          fileName: fileName,
          startDateTime: normalInterventionDetails.startTimeOfIntervention!,
          endDateTime: normalInterventionDetails.endTimeOfIntervention!,
          latitude: normalInterventionDetails.latitude.toString(),
          longitude: normalInterventionDetails.longitude.toString(),
          normalInterventionDetails: normalInterventionDetails,
          interventionId: interventionId,
          interventionStatus: interventionStatus,
        );

      ///emitting the uploaded state after intervention is ended with pdf uploaded
      emit(InterventionDetailsUploaded(pdfFile: file, isUploadedSuccessfully: true));
    } catch (e) {
      emit(InterventionDetailsError("$e"));
    }
  }

  ///[changePageState] This function is used to change the page state
  void changePageState(InterventionDetailsState state) {
    emit(state);
  }
}