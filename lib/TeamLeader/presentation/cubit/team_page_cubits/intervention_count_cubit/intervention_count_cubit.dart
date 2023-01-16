import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:imc/common_models/interventions_count_model.dart';
import 'package:meta/meta.dart';

part 'intervention_count_state.dart';

class InterventionCountCubit extends Cubit<InterventionCountState> {
  final TeamLeaderRepository _teamLeaderRepository;
  InterventionCountCubit(this._teamLeaderRepository) : super(InterventionCountInitial());

  Records? _records;

  ///[getTeamLeaderInterventionsCount] will get the intervention counts(to-do,realized,grip case) for the team leader
  Future<void> getTeamLeaderInterventionsCount() async {
    emit(InterventionCountLoading());
    try {
      _records = await _teamLeaderRepository.getInterventionsCount();
      emit(InterventionCountLoaded(_records));
    } catch (e) {
      log("team_leader_intervention_cubit error : $e");
      emit(InterventionCountError("$e"));
    }
  }

  void resetCubit(){
    emit(InterventionCountInitial());
    _records = null;
  }
}