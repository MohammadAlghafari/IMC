import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_question_cubit.dart';

class TeamLeaderQuestionHelperFunctions {
  /// The function [saveTeamLeaderQuestionAnswersInBloc] will save the function in bloc
  static void saveTeamLeaderQuestionAnswersInBloc(BuildContext context, TeamLeaderQuestionModel questionAndAnswers, int flow) {
    var _bloc = BlocProvider.of<TeamLeaderQuestionCubit>(context);
    _bloc.saveTeamLeaderQuestionAnswersInBloc(questionAndAnswers, flow);
    log("VQD bloc ============= ${questionAndAnswers.toJson()}");
  }
}