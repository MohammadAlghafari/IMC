import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_yes_no_flags_widget.dart';
import 'package:imc/TeamLeader/data/model/team_leader_question_model.dart';
import 'package:imc/TeamLeader/presentation/pages/team_leader_vqd_screens/team_leader_vqd_screen_helper/team_leader_helper_functions.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:imc/common_widgets/custom_text.dart';

class TeamLeaderQuestionWidget extends StatefulWidget {
  final TeamLeaderQuestionModel question;
  final int flow;
  final Function onSubmitPressed;
  const TeamLeaderQuestionWidget({Key? key, required this.question, required this.flow, required this.onSubmitPressed}) : super(key: key);

  @override
  State<TeamLeaderQuestionWidget> createState() => _TeamLeaderQuestionWidgetState();
}

class _TeamLeaderQuestionWidgetState extends State<TeamLeaderQuestionWidget> {
  late TextEditingController _commentTextFieldController;

  @override
  void initState() {
    super.initState();
    _commentTextFieldController = TextEditingController(text: widget.question.comment);
  }

  ///[disableButton] function will disable button if all the details for any questions are not filled
  bool disableButton(TeamLeaderQuestionModel question) {
    if (question.questionAnswer != null && question.questionAnswer == true) {
      return false;
    }
    if (question.comment == null ||
        (question.comment != null && question.comment!.isEmpty) ||
        question.questionAnswer == null ||
        question.questionAsked == null ||
        question.questionImage1 == null ||
        question.questionImage2 == null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizatons = AppLocalizations.of(context);

    return Container(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    InterventionDetailsYesNoFlagWidget(
                      value: widget.question.questionAnswer,
                      title: "${widget.question.questionAsked}",
                      yesButtonText: appLocalizatons.translate("compliant"),
                      noButtonText: appLocalizatons.translate("non-compliant"),
                      onButtonPressed: (bool value) {
                        final newAnswers = widget.question.copyWith(questionAnswer: value);
                        TeamLeaderQuestionHelperFunctions.saveTeamLeaderQuestionAnswersInBloc(context, newAnswers, widget.flow);
                      },
                    ),
                    if (widget.question.questionAnswer == false)
                      Column(
                        children: [
                          SizedBox(
                            height: 14.h,
                          ),
                          AppBoldText(appLocalizatons.translate("photos_of_the_non_compliance")),
                          Wrap(
                            spacing: 24.w,
                            children: [
                              InterventionDetailsImageContainerWidget(
                                filePath: widget.question.questionImage1,
                                onImageSelected: (String? filePath) {
                                  final newAnswers = widget.question.copyWith(questionImage1: filePath);
                                  TeamLeaderQuestionHelperFunctions.saveTeamLeaderQuestionAnswersInBloc(context, newAnswers, widget.flow);
                                },
                              ),
                              InterventionDetailsImageContainerWidget(
                                filePath: widget.question.questionImage2,
                                onImageSelected: (String? filePath) {
                                  final newAnswers = widget.question.copyWith(questionImage2: filePath);
                                  TeamLeaderQuestionHelperFunctions.saveTeamLeaderQuestionAnswersInBloc(context, newAnswers, widget.flow);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          AppBoldText(appLocalizatons.translate("explanations")),
                          SizedBox(
                            height: 12.h,
                          ),
                          InterventionDetailsTextFieldLarge(
                            hintText: appLocalizatons.translate("submit_your_observation_here"),
                            textEditingController: _commentTextFieldController,
                            onChanged: (_) {
                              final newAnswers = widget.question.copyWith(comment: _commentTextFieldController.text);
                              TeamLeaderQuestionHelperFunctions.saveTeamLeaderQuestionAnswersInBloc(context, newAnswers, widget.flow);
                            },
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 0.02.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 36.w),
            child: Row(
              children: [
                Expanded(
                  child: CommonRoundedButton(
                    btnText: appLocalizatons.translate("next"),
                    textColor: Colors.white,
                    color: AppColor.kPrimaryColor,
                    onPressed: disableButton(widget.question)
                        ? null
                        : () {
                      //saving the question's answers in the 'team leader question answers' bloc
                      final newAnswers = widget.question.copyWith(comment: _commentTextFieldController.text);
                      TeamLeaderQuestionHelperFunctions.saveTeamLeaderQuestionAnswersInBloc(context, newAnswers, widget.flow);
                      widget.onSubmitPressed();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  ///disposing the text editing controller after use
  @override
  void dispose() {
    super.dispose();
    _commentTextFieldController.dispose();
  }
}