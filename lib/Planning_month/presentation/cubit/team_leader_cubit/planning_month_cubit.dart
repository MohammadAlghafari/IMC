import 'package:bloc/bloc.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_repository.dart';
import 'package:meta/meta.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;


part 'planning_month_state.dart';


class TeamLeaderPlanningMonthCubit extends Cubit<TeamLeaderPlanningMonthState> {

  final TeamLeaderRepository _teamLeaderRepository;
  TeamLeaderPlanningMonthCubit(this._teamLeaderRepository) : super(TeamLeaderPlanningMonthInitial());

  ///[getTeamLeaderInterventionForDateRange]function will return the list of intervention (with given status types) of a team leader for a particular date range
  Future<void> getTeamLeaderInterventionForDateRange(String startDate, String endDate, List<int> statusList) async{
    try {
      emit(TeamLeaderPlanningMonthLoading());
      List<teamLeaderInterventionModel.Records?>? _listOfRecords = await _teamLeaderRepository
          .getListOfTeamLeaderVisitsByDateRangeAndStatus(startDate, endDate,statusList);
      emit(TeamLeaderPlanningMonthLoaded(_listOfRecords));
    }

    catch(e){
      emit(TeamLeaderPlanningMonthError("${e}"));
    }
  }

  void resetCubit(){
    emit(TeamLeaderPlanningMonthInitial());
  }

}