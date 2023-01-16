import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_question_repository.dart';
import 'package:imc/TeamLeader/utils/team_lead_flow_vqd_constants.dart';
import 'package:meta/meta.dart';

part 'team_leader_question_state.dart';

class TeamLeaderQuestionCubit extends Cubit<TeamLeaderQuestionState> {
  final TeamLeaderQuestionRepository _teamLeaderQuestionRepository;
  TeamLeaderQuestionCubit(this._teamLeaderQuestionRepository) : super(TeamLeaderQuestionInitial());

  /// The function [saveInterventionDetailsInBloc] saves the data coming from the user
  /// into the bloc and emits according to the passed flow value it.
  Future<void> saveTeamLeaderQuestionAnswersInBloc(TeamLeaderQuestionModel questionsAnswers, int flow) async {
    List<TeamLeaderQuestionModel>? _listOfQuestionsAndAnswers;

    // According to the flow the team leader selects we will get list of question from the repository
    if (flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList1;
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterNotAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList2;
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList3;
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterNotAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList4;
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList5;
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterNotAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList6;
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList7;
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterNotAccessible) {
      _listOfQuestionsAndAnswers = _teamLeaderQuestionRepository.getQuestionsAnswersOfTeamLeaderForList8;
    }

    // The index to be replaced will be the id - 1 because in list ["apple" , "ball", "cat"]
    // id of "ball" is 2 but the index is 1
    final indexToBeReplaced = questionsAnswers.id! - 1;
    // replacing the object in the array at that particular index
    _listOfQuestionsAndAnswers![indexToBeReplaced] = questionsAnswers;

    // Setting back the list of answers for those question according to
    // the flow selected by the team leader
    if (flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList1(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterNotAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList2(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList3(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterNotAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList4(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList5(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterNotAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList6(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList7(_listOfQuestionsAndAnswers);
    } else if (flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterNotAccessible) {
      _teamLeaderQuestionRepository.setQuestionsAnswersOfTeamLeaderForList8(_listOfQuestionsAndAnswers);
    }
    // Emitting the new loaded question answers
    emit(TeamLeaderQuestionLoaded(_listOfQuestionsAndAnswers));
  }

  // This function changes the page state
  void changeTeamLeaderQuestionsPageState(TeamLeaderQuestionState state) {
    emit(state);
  }
}