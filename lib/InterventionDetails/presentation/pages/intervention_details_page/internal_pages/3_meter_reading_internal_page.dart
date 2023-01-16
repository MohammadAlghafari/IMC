import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/intervention_details_model.dart';
import 'package:imc/InterventionDetails/presentation/cubit/intervention_details_cubit/intervention_details_cubit.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/intervention_details_page_helpers/intervention_details_page_index_helper_functions.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_image_container_widget.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_selection_container_n_bottom_sheet.dart';
import 'package:imc/InterventionDetails/presentation/pages/intervention_details_page/widgets/intervention_details_textfield_small.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class MeterReadingInternalPage extends StatefulWidget {
  const MeterReadingInternalPage({Key? key}) : super(key: key);

  @override
  State<MeterReadingInternalPage> createState() => _MeterReadingInternalPageState();
}

class _MeterReadingInternalPageState extends State<MeterReadingInternalPage> {
  int maxNumberOfImagesAllowed = 3;
  String offPeakTime = "00:00:00"; //default value for off peak time field
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return BlocConsumer<InterventionDetailsCubit, InterventionDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is InterventionDetailsLoaded) {
          InterventionDetailsModel _interventionDetails = state.interventionDetails;
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    AppBoldText(appLocalizations.translate("meter_rate")),
                    SizedBox(height: 10),
                    InterventionDetailsSelectionContainer(
                      hint: appLocalizations.translate("base_rate"),
                      listOfItems: ["Heure Creuse", "EJP", "Temp"],
                      value: _interventionDetails.meterRate,
                      onBtnPressed: (String? value) {
                        var interventionDetails = _interventionDetails.copyWith(meterRate: value);
                        InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                      },
                    ),
                    SizedBox(height: 0.04.sh),
                    AppBoldText(appLocalizations.translate("consumption_index")),
                    SizedBox(height: 0.02.sh),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppBoldText(appLocalizations.translate("full_time"), color: AppColor.kPrimaryColor, fontSize: 13.sp),
                              SizedBox(height: 10),
                              InterventionDetailsTextFieldSmall(
                                hintText: "0000",
                                keyboardType: TextInputType.number,
                                initialText: _interventionDetails.fullTimeRate,
                                onChanged: (String value) {
                                  var interventionDetails = _interventionDetails.copyWith(fullTimeRate: value);
                                  InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppBoldText(appLocalizations.translate("off_peak_time"), color: AppColor.kPrimaryColor, fontSize: 13.sp),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  context: context,
                                  builder: (context) => Container(
                                    height: 0.4.sh,
                                    decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CupertinoTimerPicker(
                                          onTimerDurationChanged: (val) {
                                            offPeakTime = val.toString().substring(0, 8);
                                          },
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 50),
                                          width: 1.sw,
                                          child: CommonRoundedButton(
                                              btnText: appLocalizations.translate("done"),
                                              textColor: Colors.white,
                                              color: AppColor.kPrimaryColor,
                                              onPressed: () {
                                                var interventionDetails = _interventionDetails.copyWith(offPeakTime: offPeakTime);
                                                InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                                                Navigator.of(context).pop();
                                                FocusManager.instance.primaryFocus?.unfocus();
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: (_interventionDetails.offPeakTime == null)
                                            ? AppBoldText("${offPeakTime}", color: Colors.grey)
                                            : AppBoldText('${_interventionDetails.offPeakTime}'),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey,
                                        size: 30.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    AppBoldText(appLocalizations.translate("photo(s)_of_index")),
                    if (_interventionDetails.photoOfIndexImage != null && _interventionDetails.photoOfIndexImage!.isNotEmpty)
                      ...List.generate((_interventionDetails.photoOfIndexImage?.length ?? 0), (index) {
                        return InterventionDetailsImageContainerWidget(
                          filePath: _interventionDetails.photoOfIndexImage![index],
                          onImageSelected: (String? filePath) {
                            var photoOfIndexList = _interventionDetails.photoOfIndexImage;
                            photoOfIndexList![index] = filePath!;
                            var interventionDetails = _interventionDetails.copyWith(photoOfIndexImage: photoOfIndexList);
                            InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                          },
                        );
                      }),
                    if ((_interventionDetails.photoOfIndexImage?.length ?? 0) < maxNumberOfImagesAllowed)
                      GestureDetector(
                        onTap: () {
                          // this is added to display one more image container;
                          var newList = _interventionDetails.photoOfIndexImage;
                          newList!.add("");
                          var interventionDetails = _interventionDetails.copyWith(photoOfIndexImage: newList);
                          InterventionDetailsHelperFunctions.saveInterventionDetailsInBloc(context, interventionDetails);
                        },
                        child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.kPrimaryColor),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.add, color: Colors.white, size: 30),
                            )),
                      )
                  ],
                ),
              ));
        } else
          return SizedBox.shrink();
      },
    );
  }
}