import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/data/models/rc_intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/cubit/rc_intervention_details_cubit/rc_intervention_details_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/team_leader_cubit/planning_month_cubit.dart';
import 'package:imc/Planning_month/presentation/cubit/technician_cubit/planning_month_cubit.dart';
import 'package:imc/TeamLeader/data/local_database/team_leader_hive_helper.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_leader_upload_pdf_cubit/team_leader_questions_upload_pdf_cubit.dart';
import 'package:imc/base_screen/presentation/pages/team_lead_base_screen_index.dart';
import 'package:imc/base_screen/presentation/pages/technician_base_screen_index.dart';
import 'package:imc/common_models/intervention_record_model.dart' as InterventionModel;
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

import 'package:imc/common_widgets/custom_sheet_button.dart';
import 'package:imc/common_widgets/custom_text.dart';

import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_constant.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:open_file/open_file.dart';

class UploadInterventionPdfScreen extends StatefulWidget {
  final bool isRc;
  final File pdfFile;
  final bool isGrip;
  final bool isForceGrip;
  final bool? isTeamLeader;
  final String? teamLeaderEndInterventionTime;
  final teamLeaderInterventionModel.Records? teamLeaderInterventionRecords;
  final teamMemberInterventionRecordModel.Records? teamMemberInterventionRecords;
  final InterventionModel.Records? interventionRecord;
  final RCInterventionDetailsModel? rcIntervention;
  final InterventionDetailsModel? normalInterventionDetails;
  UploadInterventionPdfScreen(
      {Key? key,
        required this.pdfFile,
        this.interventionRecord,
        required this.isRc,
        required this.isForceGrip,
        this.teamLeaderEndInterventionTime,
        this.teamLeaderInterventionRecords,
        this.teamMemberInterventionRecords,
        this.isTeamLeader = false,
        this.normalInterventionDetails,
        this.rcIntervention,
        required this.isGrip})
      : super(key: key);

  @override
  State<UploadInterventionPdfScreen> createState() => _UploadInterventionPdfScreenState();
}

class _UploadInterventionPdfScreenState extends State<UploadInterventionPdfScreen> {
  @override
  void initState() {
    super.initState();
    //if the flow is team leader, proceed with ending team leader intervention
    if (widget.isTeamLeader != null && widget.isTeamLeader == true) {
      _endTeamLeaderIntervention();
    }
    //if the flow is technician Rc, proceed with the ending technician rc intervention
    if (widget.isRc) {
      if (widget.rcIntervention != null && widget.rcIntervention != null) {
        _endTechnicianRcIntervention(widget.rcIntervention!, widget.isGrip);
      }
    } else {
      //if the the flow is technician normal intervention, proceed with ending technician normal intervention
      if (widget.normalInterventionDetails != null) {
        _endTechnicianNormalIntervention(widget.normalInterventionDetails!, widget.isGrip);
      }
    }
  }

  ///[getInterventionStatus] function will return the intervention status according to the case (grip,force grip or success)
  int getInterventionStatus({required bool isGripVal, required bool isForceGripVal}) {
    int status = InterventionStatus.InterventionStatusPlanifiee.interventionStatusCode;
    if (isGripVal && !isForceGripVal) {
      status = InterventionStatus.InterventionStatusAnePasRealiser.interventionStatusCode;
    } else if (isForceGripVal && isForceGripVal) {
      status = InterventionStatus.InterventionStatusStandBy.interventionStatusCode;
    } else {
      status = InterventionStatus.InterventionStatusRealisee.interventionStatusCode;
    }
    return status;
  }

  ///[_endTechnicianNormalIntervention]  function will access the technician intervention bloc and will end the intervention by calling [endIntervention]
  void _endTechnicianNormalIntervention(InterventionDetailsModel normalInterventionDetails, bool isGrip) {
    final _cubit = BlocProvider.of<InterventionDetailsCubit>(context);
    if (widget.interventionRecord != null) {
      final fileName = "InterventionId_${widget.interventionRecord!.id}_ClientId_${widget.interventionRecord!.client?.id}.pdf";
      _cubit.endIntervention(
        widget.pdfFile,
        fileName: fileName,
        interventionId: widget.interventionRecord!.id!,
        normalInterventionDetails: normalInterventionDetails,
        interventionStatus: getInterventionStatus(isGripVal: widget.isGrip, isForceGripVal: widget.isForceGrip),
      );
    }
  }

  ///[_endTechnicianRcIntervention]  function will access the technician RC intervention bloc and will end the intervention by calling [endRCIntervention]
  void _endTechnicianRcIntervention(RCInterventionDetailsModel rcIntervention, bool isGrip) {
    final _cubit = BlocProvider.of<RCInterventionDetailsCubit>(context);
    if (widget.interventionRecord != null) {
      final fileName = "InterventionId_${widget.interventionRecord!.id}_ClientId_${widget.interventionRecord!.client?.id}.pdf";
      _cubit.endRCIntervention(
        widget.pdfFile,
        fileName: fileName,
        interventionId: widget.interventionRecord!.id!,
        rcIntervention: rcIntervention,
        interventionStatus: getInterventionStatus(isGripVal: widget.isGrip, isForceGripVal: widget.isForceGrip),
      );
    }
  }

  ///[_endTeamLeaderIntervention] will access the team leader question bloc and will end the team leader visit by calling [endTeamLeaderVisit]
  void _endTeamLeaderIntervention() {
    final _cubit = BlocProvider.of<TeamLeaderQuestionsUploadPdfCubit>(context);
    if (widget.isTeamLeader == true && widget.teamLeaderInterventionRecords != null && widget.teamLeaderEndInterventionTime != null) {
      final fileName = "ID_${widget.teamLeaderInterventionRecords!.id}_ClientId_${widget.teamLeaderInterventionRecords!.client!.id}.pdf";

      _cubit.endTeamLeaderVisit(
        clientId: widget.teamLeaderInterventionRecords!.client!.id!,
        visitId: widget.teamLeaderInterventionRecords!.id!,
        schedule: widget.teamLeaderInterventionRecords!.scheduleStart!,
        starDateTime: TeamLeaderHiveHelper.getInterventionStartTime!,
        endDateTime: widget.teamLeaderEndInterventionTime!,
        latitude: TeamLeaderHiveHelper.getLatitude!,
        longitude: TeamLeaderHiveHelper.getLongitude!,
        pdfFile: widget.pdfFile,
        pdfName: fileName,
      );
    }
    //if we procceded with team member flow then 'visit_id' will be used to end the intervention(all other fields will be same as the team leader end visit)
    if (widget.isTeamLeader == true && widget.teamMemberInterventionRecords != null && widget.teamLeaderEndInterventionTime != null) {
      final fileName = "ID_${widget.teamMemberInterventionRecords!.visitId}_ClientId_${widget.teamMemberInterventionRecords!..client!.id!}.pdf";
      _cubit.endTeamLeaderVisit(
        clientId: widget.teamMemberInterventionRecords!.client!.id!,
        visitId: widget.teamMemberInterventionRecords!.visitId!,
        schedule: widget.teamMemberInterventionRecords!.scheduleStart!,
        starDateTime: TeamLeaderHiveHelper.getInterventionStartTime!,
        endDateTime: widget.teamLeaderEndInterventionTime!,
        latitude: TeamLeaderHiveHelper.getLatitude!,
        longitude: TeamLeaderHiveHelper.getLongitude!,
        pdfFile: widget.pdfFile,
        pdfName: fileName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: (widget.isTeamLeader ?? false)
          ? Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                return TeamLeadBaseScreenIndex();
              }), (route) => false);
            },
          ),
        ),
        body: BlocBuilder<TeamLeaderQuestionsUploadPdfCubit, TeamLeaderQuestionsUploadPdfState>(
          builder: (context, state) {
            if (state is TeamLeaderQuestionsUploadPdfUploading) {
              return InterventionPdfUploadingWidget(
                  appLocalizations: appLocalizations, widgetText: "Team Leader Questions " + appLocalizations.translate("uploading_pdf_file"));
            }
            else if (state is TeamLeaderQuestionsUploadPdfUploaded) {
              return InterventionCompletedWidget(
                appLocalizations: appLocalizations,
                pdf: state.pdf,
                onPress: () {
                  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                    return TeamLeadBaseScreenIndex();
                  }), (route) => false);
                },
              );
            }
            else if (state is TeamLeaderQuestionsUploadPdfError){
              print("${state.errorMessage}");
              return Center(
                child: Text("${state.errorMessage}", textAlign: TextAlign.center,),
              );
            }
            else {
              return SizedBox.shrink();
            }
          },
        ),
      )
          : (Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.kPrimaryColor,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                // resetting the planning month cubit
                BlocProvider.of<PlanningMonthCubit>(context).resetCubit();
                BlocProvider.of<TeamLeaderPlanningMonthCubit>(context).resetCubit();

                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                  return BaseScreenIndex();
                }), (route) => false);
              },
            ),
          ),
          body: widget.isRc
              ? BlocBuilder<RCInterventionDetailsCubit, RCInterventionDetailsState>(
            builder: (context, state) {
              if (state is RCInterventionDetailsUploading) {
                return InterventionPdfUploadingWidget(
                    appLocalizations: appLocalizations, widgetText: "RC " + appLocalizations.translate("uploading_pdf_file"));
              }
              else if (state is RCInterventionDetailsUploaded) {
                return InterventionCompletedWidget(
                  appLocalizations: appLocalizations,
                  pdf: state.pdfFile!,
                  onPress: () {
                    // resetting the planning month cubit
                    BlocProvider.of<PlanningMonthCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningMonthCubit>(context).resetCubit();

                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                      return BaseScreenIndex();
                    }), (route) => false);
                  },
                );
              }
              else if (state is RCInterventionDetailsError){
                print("${state.errorMessage}");
                return Center(
                  child: Text("${state.errorMessage}", textAlign: TextAlign.center,),
                );
              }
              else
                return SizedBox.shrink();
            },
          )
              : BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
            builder: (context, state) {
              if (state is InterventionDetailsUploading) {
                return InterventionPdfUploadingWidget(
                    appLocalizations: appLocalizations, widgetText: appLocalizations.translate("uploading_pdf_file"));
              }
              else if (state is InterventionDetailsUploaded) {
                return InterventionCompletedWidget(
                  appLocalizations: appLocalizations,
                  pdf: state.pdfFile!,
                  onPress: () {
                    // resetting the planning month cubit
                    BlocProvider.of<PlanningMonthCubit>(context).resetCubit();
                    BlocProvider.of<TeamLeaderPlanningMonthCubit>(context).resetCubit();
                    Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (BuildContext context) {
                      return BaseScreenIndex();
                    }), (route) => false);
                  },
                );
              }
              else if (state is InterventionDetailsError){
                print("${state.errorMessage}");
                return Center(
                  child: Text("${state.errorMessage}", textAlign: TextAlign.center,),
                );
              }
              else
                return SizedBox.shrink();
            },
          ))),
    );
  }
}

class InterventionPdfUploadingWidget extends StatelessWidget {
  const InterventionPdfUploadingWidget({
    Key? key,
    required this.appLocalizations,
    required this.widgetText,
  }) : super(key: key);

  final AppLocalizations appLocalizations;
  final String widgetText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 0.02.sh,
          ),
          AppRegularText(widgetText),
        ],
      ),
    );
  }
}

class InterventionCompletedWidget extends StatelessWidget {
  const InterventionCompletedWidget({
    Key? key,
    required this.appLocalizations,
    required this.pdf,
    required this.onPress,
  }) : super(key: key);

  final AppLocalizations appLocalizations;
  final File pdf;

  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: .03.sh),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcons.warning, scale: 3),
              SizedBox(
                height: 0.02.sh,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AppBoldText(appLocalizations.translate("intervention_completed_successfully"),
                    fontSize: 18.sp, color: Colors.black, textAlign: TextAlign.center),
              ),
              SizedBox(
                height: 0.04.sh,
              ),
              CupertinoButton(
                  child: AppRegularText(appLocalizations.translate("view_pdf")),
                  onPressed: () {
                    OpenFile.open("${pdf.path}");
                  })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomSheetButton(
            textColor: Colors.white,
            title: appLocalizations.translate("close_intervention"),
            color: AppColor.kPrimaryColor,
            onPressed: onPress,
          ),
        ),
        SizedBox(
          height: 0.02.sh,
        )
      ],
    );
  }
}