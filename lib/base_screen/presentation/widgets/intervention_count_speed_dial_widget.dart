import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:imc/common_models/interventions_count_model.dart';
import 'package:imc/TeamLeader/presentation/cubit/team_page_cubits/intervention_count_cubit/intervention_count_cubit.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionCountSpeedDialWidget extends StatefulWidget {
  const InterventionCountSpeedDialWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<InterventionCountSpeedDialWidget> createState() => _InterventionCountSpeedDialWidgetState();
}

class _InterventionCountSpeedDialWidgetState extends State<InterventionCountSpeedDialWidget> {
  @override
  void initState() {
    //accessing the 'intervention count' bloc
    final _interventionsCountBloc = BlocProvider.of<InterventionCountCubit>(context);
    //getting total of interventions count for the technician from the 'intervention count' bloc
    _interventionsCountBloc.getTeamLeaderInterventionsCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocConsumer<InterventionCountCubit, InterventionCountState>(
      listener: (_, state){
        if(state is InterventionCountError){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appLocalizations.translate("an_error_occured"))));
        }
      },
      builder: (context, state) {
        if (state is InterventionCountLoading) {
          return SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColor.kWhiteColor,
              strokeWidth: 3.0,
            ),
          );
        } else if (state is InterventionCountLoaded) {
          final Records? interventionsCount = state.interventionsCount;
          return SpeedDial(
            closeDialOnPop: false,
            direction: SpeedDialDirection.left,
            child: Text(
              "${(interventionsCount?.anepasraliser ?? 0) + (interventionsCount?.ralise ?? 0) + (interventionsCount?.standby ?? 0)}",
            ),
            backgroundColor: Colors.blue,
            // activeIcon: Icons.close,
            buttonSize: Size(45, 45),
            childrenButtonSize: Size(55, 55), elevation: 0,
            overlayOpacity: 0.1,
            children: [
              SpeedDialChild(
                  child: Text(
                    '${interventionsCount?.ralise ?? 0}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColor.kSuccessColor),
              SpeedDialChild(
                  child: Text(
                    '${interventionsCount?.standby ?? 0}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColor.kToDOColor),
              SpeedDialChild(
                  onTap: () {},
                  child: Text(
                    '${interventionsCount?.anepasraliser ?? 0}',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColor.kCaseColor)
            ],
            // animatedIcon: AnimatedIcons.menu_close,
          );
        }
        else if (state is InterventionCountError) {
          return Text("-", style: TextStyle(color: Colors.white),);

        }
        return SizedBox.shrink();
      },
    );
  }
}