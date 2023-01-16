import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/presentation/cubit/customer_interventions_history_cubit/customer_interventions_history_cubit_cubit.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:imc/common_models/InterventionHistoryModel.dart' as interventionHistory;
import 'package:imc/TeamLeader/data/model/team_leader_intervention_record.dart' as teamLeaderInterventionModel;
import 'package:imc/TeamLeader/data/model/team_member_intervention_record.dart' as teamMemberInterventionRecordModel;

import '../../../../../common_models/intervention_record_model.dart';

class CustomerInterventionHistoryWidget extends StatefulWidget {
  final Records? interventionRecord;
  final teamLeaderInterventionModel.Records? teamLeaderinterventionRecords;
  final teamMemberInterventionRecordModel.Records? teamMemberInterventionRecords;

  const CustomerInterventionHistoryWidget({Key? key, this.interventionRecord, this.teamLeaderinterventionRecords,this.teamMemberInterventionRecords}) : super(key: key);

  @override
  State<CustomerInterventionHistoryWidget> createState() => _CustomerInterventionHistoryWidgetState();
}

class _CustomerInterventionHistoryWidgetState extends State<CustomerInterventionHistoryWidget> {
  @override
  void initState() {
    super.initState();
    _initCustomerInterventionsHistory();
  }

  void _initCustomerInterventionsHistory() {
    //if the flow is technician intervention
    if (widget.interventionRecord != null) {
      //initialising the 'customer interventions history details' from the Customer Intervention History Bloc by passing the 'interventionId'
      final _customerInterventionsCubit = BlocProvider.of<CustomerInterventionsHistoryCubit>(context);
      _customerInterventionsCubit.getCustomerInterventionsHistory(interventionId: widget.interventionRecord!.id!);
    } //if the flow is team leader visit
    else if (widget.teamLeaderinterventionRecords != null) {
      //initialising the 'customer interventions history details' by passing the team leader's 'interventionId'
      final _customerInterventionsCubit = BlocProvider.of<CustomerInterventionsHistoryCubit>(context);
      _customerInterventionsCubit.getCustomerInterventionsHistory(interventionId: widget.teamLeaderinterventionRecords!.id!);
    } else if (widget.teamMemberInterventionRecords != null && widget.teamMemberInterventionRecords?.visitId !=null) {
      //initialising the 'customer interventions history details' by passing the team leader's 'interventionId'
      final _customerInterventionsCubit = BlocProvider.of<CustomerInterventionsHistoryCubit>(context);
      _customerInterventionsCubit.getCustomerInterventionsHistory(interventionId: widget.teamMemberInterventionRecords!.visitId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<CustomerInterventionsHistoryCubit, CustomerInterventionsHistoryState>(
      builder: (context, state) {
        if (state is CustomerInterventionsHistoryLoaded) {
          List<interventionHistory.Records?>? interventionsHistory = state.interventionsHistorires;
          final int listLength = (interventionsHistory?.length ?? 0) < 1 ? 1 : interventionsHistory!.length;

          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: listLength,
            itemBuilder: (context, index) {
              if (interventionsHistory == null || interventionsHistory.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      AppRegularText(appLocalizations.translate("there_are_no_history_available_for_this_duration")),
                    ],
                  ),
                );
              }

              final interventionHistory.Records? record = interventionsHistory[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5.0)], borderRadius: BorderRadius.circular(5)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0.01.sh),
                  decoration: BoxDecoration(color: AppColor.kWhiteColor, borderRadius: BorderRadius.circular(5)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      AppBoldText("${record?.lastModified}", fontSize: 14.sp, color: AppColor.kPrimaryColor),
                      SizedBox(height: 5),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppRegularText("Message: ${record?.message}"),
                            // if (record!.pdf != null || (record.pdf != null && record.pdf!.isNotEmpty)) AppRegularText(""),
                            if (record!.pdf != null || (record.pdf != null && record.pdf!.isNotEmpty))
                              TextButton(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () async {
                                  final _customerInterventionsCubit = BlocProvider.of<CustomerInterventionsHistoryCubit>(context);
                                  if (record.pdf != null || (record.pdf != null && record.pdf!.isNotEmpty)) {
                                    Directory? tempDir;
                                    if(Platform.isAndroid){
                                      tempDir = await getApplicationDocumentsDirectory();
                                    }
                                    else{
                                      tempDir = await getTemporaryDirectory();
                                    }

                                    String fullPath = tempDir.path + "${record.pdf}";
                                    // String url = APIRoutes.downloadPdfurl(record.pdf!);
                                    _customerInterventionsCubit.downloadPdf(url: record.pdf!, savePath: fullPath);
                                  }
                                },
                                child: AppBoldText(appLocalizations.translate("view_pdf")),
                              ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 0.02.sh,
              );
            },
          );
        } else if (state is CustomerInterventionsHistoryError) {
          return Center(child: AppRegularText("${appLocalizations.translate("an_error_occured")}"));
        } else if (state is PDFDownloading) {
          return Stack(
            children: [
              Container(
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: CircularProgressIndicator()),
                  SizedBox(height: 12),
                  AppBoldText(appLocalizations.translate("downloading_pdf"), color: Colors.black),
                ],
              )
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}