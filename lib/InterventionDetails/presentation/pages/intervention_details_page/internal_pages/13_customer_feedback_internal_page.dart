
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/Intervention_details_textfiled_large.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:signature/signature.dart';

class CustomerFeedbackInternalPage extends StatelessWidget {
  CustomerFeedbackInternalPage({Key? key, required this.controller}) : super(key: key);
  final SignatureController controller;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocBuilder<InterventionDetailsCubit, InterventionDetailsState>(
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(height: 0.03.sh),
                        AppBoldText(appLocalizations.translate("customer_comments"), fontSize: 14),
                        SizedBox(height: 0.01.sh),
                        InterventionDetailsTextFieldLarge(
                          hintText: appLocalizations.translate("type_your_comment_here"),
                          initialText: _interventionDetails.customerFeedbackComment,
                          onChanged: (String value) {
                            //*saving all the inputted values into the intervention details bloc
                            var interventionDetails = _interventionDetails.copyWith(customerFeedbackComment: value);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        ),
                        SizedBox(height: 0.04.sh),
                        AppBoldText(appLocalizations.translate("electonic_signature"), fontSize: 14),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 0.26.sh,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Signature(
                              controller: controller,
                              backgroundColor: Colors.grey.shade500,
                              height: 0.25.sh,
                            ),
                          ),
                          color: Colors.grey.shade300,
                        ),
                        CupertinoButton(
                            child: AppRegularText(
                              appLocalizations.translate("clear_signature"),
                              color: AppColor.kPrimaryColor,
                            ),
                            onPressed: () {
                              controller.clear();
                            }),
                      ],
                    ),
                  ),
                ],
              ));
        } else
          return SizedBox.shrink();
      },
    );
  }
}