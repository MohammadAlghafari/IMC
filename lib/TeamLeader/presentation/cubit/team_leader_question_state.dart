part of 'team_leader_question_cubit.dart';

@immutable
abstract class TeamLeaderQuestionState {
  const TeamLeaderQuestionState();
}

class TeamLeaderQuestionInitial extends TeamLeaderQuestionState {
  const TeamLeaderQuestionInitial();
}

class TeamLeaderQuestionLoaded extends TeamLeaderQuestionState {
  // These are the list of question that are asked from the team leader
  final List<TeamLeaderQuestionModel> listOfQuestion;
  const TeamLeaderQuestionLoaded(this.listOfQuestion);
}

