import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecord;
import 'package:imc/TeamLeader/data/model/team_leader_team_members_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_member/cubit/team_member_interventions_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/success_page/team_member/team_member_success_screen_index.dart';

import 'package:imc/TeamLeader/presentation/pages/technicien_details_screen/details_screen_realized_widget.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/utils/app_localizations.dart';

class DetailsScreenTodoWidget extends StatefulWidget {
  const DetailsScreenTodoWidget({Key? key, required this.teamMemberRecord}) : super(key: key);
  final Records teamMemberRecord;
  @override
  State<DetailsScreenTodoWidget> createState() => _DetailsScreenTodoWidgetState();
}

class _DetailsScreenTodoWidgetState extends State<DetailsScreenTodoWidget> {
  @override
  void initState() {
    initTeamMemberTodoInterventions();
    super.initState();
  }

  ///[initTeamMemberTodoInterventions] will initialise the interventions(todos) data of today
  initTeamMemberTodoInterventions() {
    //accessing the 'teamleader to-do interventions' bloc
    final _bloc = BlocProvider.of<TeamMemberTodoInterventionsCubit>(context);

    //getting today data and time
    String _today = DateTime.now().toString().substring(0, 10);

    //passing today data and time and getting the interventions list(todos)
    _bloc.getTeamMemberTodoInterventionsByDateRangeStatus(
      _today,
      _today,
      widget.teamMemberRecord.collaboratorId!,
      [
        InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<TeamMemberTodoInterventionsCubit, TeamMemberInterventionsState>(
      builder: (context, state) {
        if (state is TeamMemberInterventionsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TeamMemberInterventionsLoaded) {

          final List<teamMemberInterventionRecord.Records?>? recordsList = state.listOfRecords!;
          final int listLength = (recordsList?.length ?? 0) < 1 ? 1 : recordsList!.length;
          return ListView.builder(
            itemCount: listLength,
            itemBuilder: (context, index) {
              if (recordsList == null || recordsList.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      AppRegularText(appLocalizations.translate("there_are_no_record_available_for_this_duration")),
                    ],
                  ),
                );
              }

              final interventionRecord = recordsList[index];
              return Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5))),
                child: InterventionTile(
                    isTodos: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (ctx) => TeamMemberSuccessScreenIndex(isTodos: false, teamMemberInterventionRecords: interventionRecord)));

                    },
                    tileColor: AppColor.kPrimaryColor,
                    interventionRecords: interventionRecord),
              );
            },
          );
        }
        else if (state is TeamMemberInterventionsError) {
          return Center(
            child: AppRegularText("${appLocalizations.translate("an_error_occured")}"),
          );
        }
        else {
          return SizedBox.shrink();
        }
      },
    );
  }
}