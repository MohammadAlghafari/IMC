import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'package:imc/TeamLeader/data/repository/team_leader_question_repository.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_question_cubit.dart';
import 'package:imc/TeamLeader/presentation/pages/team_account_summary_screen.dart';
import 'package:imc/TeamLeader/presentation/widgets/team_leader_question_widget.dart';
import 'package:imc/TeamLeader/utils/team_lead_flow_vqd_constants.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

class TeamLeadVQScreen extends StatefulWidget {
  final teamLeaderInterventionModel.Records? teamLeaderIntervention;
  final teamMemberInterventionRecordModel.Records? teamMemberIntervention;

  // the flow represents the questions list to be displayed by the application
  final int flow;
  const TeamLeadVQScreen({
    Key? key,
    required this.flow,
    this.teamLeaderIntervention,
    this.teamMemberIntervention,
  }) : super(key: key);

  @override
  State<TeamLeadVQScreen> createState() => _TeamLeadVQScreen();
}

class _TeamLeadVQScreen extends State<TeamLeadVQScreen> {
  int _selectedPage = 0;
  String? finalListNo; //var to show the current passed list
  PageController _pageController = PageController();

  @override
  void initState() {
    initQuestionsListFlow();
    super.initState();
  }

  ///[initQuestionsListFlow] will initialise the VQD flow according to the [flow] value passed
  void initQuestionsListFlow() {
    //accessing 'team leader questions' bloc
    final _bloc = BlocProvider.of<TeamLeaderQuestionCubit>(context);
    TeamLeaderQuestionRepository _teamLeaderQuestionRepo = TeamLeaderQuestionRepository();

    //setting the VQD flow according to the [widget.flow] value
    if (widget.flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList1));
      finalListNo = "List 1";
    } else if (widget.flow == TeamLeadFlowVQDConstants.aPosterioriClientAbsentMeterNotAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList2));
      finalListNo = "List 2";
    } else if (widget.flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList3));
      finalListNo = "List 3";
    } else if (widget.flow == TeamLeadFlowVQDConstants.aPosterioriClientPresentMeterNotAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList4));
      finalListNo = "List 4";
    } else if (widget.flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList5));
      finalListNo = "List 5";
    } else if (widget.flow == TeamLeadFlowVQDConstants.simultaneeClientAbsentMeterNotAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList6));
      finalListNo = "List 6";
    } else if (widget.flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList7));
      finalListNo = "List 7";
    } else if (widget.flow == TeamLeadFlowVQDConstants.simultaneeClientPresentMeterNotAccessible) {
      _bloc.changeTeamLeaderQuestionsPageState(TeamLeaderQuestionLoaded(_teamLeaderQuestionRepo.getQuestionsAnswersOfTeamLeaderForList8));
      finalListNo = "List 8";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if back is pressed then animate to previous page
        if (_selectedPage == 0) {
          return await true;
        } else {
          setState(() {
            _pageController.animateToPage(--_selectedPage, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
            _selectedPage = _selectedPage--;
          });
        }
        return await false;
      },
      child: Scaffold(
        body: BlocBuilder<TeamLeaderQuestionCubit, TeamLeaderQuestionState>(builder: (context, state) {
          if (state is TeamLeaderQuestionLoaded) {
            final List<TeamLeaderQuestionModel> _listOfTeamLeaderQuestionAnswers = state.listOfQuestion;
            return Stack(alignment: Alignment.topCenter, children: [
              Container(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0, offset: Offset(0, 5))],
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).viewPadding.top,
                          ),
                          ListTile(
                            leading: BackButton(
                                onPressed: () {
                                  if (_selectedPage == 0) {
                                    Navigator.pop(context);
                                    return;
                                  }
                                  setState(() {
                                    _pageController.animateToPage(--_selectedPage, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                                    _selectedPage = _selectedPage--;
                                  });
                                },
                                color: AppColor.kWhiteColor),
                            title: Center(child: AppBoldText("Mr John Doe", color: AppColor.kWhiteColor, fontSize: 18.sp)),
                            trailing: Text(""),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ..._listOfTeamLeaderQuestionAnswers.map((questionAnswer) {
                          print(_listOfTeamLeaderQuestionAnswers.length);
                          return TeamLeaderQuestionWidget(
                            question: questionAnswer,
                            flow: widget.flow,
                            onSubmitPressed: () {
                              if (_selectedPage < _listOfTeamLeaderQuestionAnswers.length - 1) {
                                setState(() {
                                  _pageController.animateToPage(++_selectedPage, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
                                  _selectedPage = _selectedPage++;
                                });
                              } else {
                                /*
                               navigating to account summary screen according to if we are coming from team members screen's
                               or if we are coming from team leader's home screen (planning day /planning week/ planning month)
                             */
                                if (widget.teamLeaderIntervention != null) {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: ((context) => TeamAccountSummaryScreen(
                                        teamLeaderInterventionRecords: widget.teamLeaderIntervention,
                                        listOfQuestionsAnswers: _listOfTeamLeaderQuestionAnswers,
                                      ))));
                                } else if (widget.teamMemberIntervention != null) {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: ((context) => TeamAccountSummaryScreen(
                                        teamMemberInterventionRecords: widget.teamMemberIntervention,
                                        listOfQuestionsAnswers: _listOfTeamLeaderQuestionAnswers,
                                      ))));
                                }
                              }
                            },
                          );
                        }).toList()
                      ],
                    ),
                  ),
                ]),
              ),
              Positioned(
                top: 0.16.sh,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)], borderRadius: BorderRadius.circular(25), color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                      child: AppBoldText("${finalListNo} : ${_selectedPage + 1}/${_listOfTeamLeaderQuestionAnswers.length}",
                          color: AppColor.kSuccessColor),
                    ),
                  ),
                ),
              )
            ]);
          } else {
            return SizedBox.shrink();
          }
        }),
      ),
    );
  }
}