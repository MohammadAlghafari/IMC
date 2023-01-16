
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/InterventionDetails/data/models/tech_marque_model.dart' as techMarque;
import 'package:imc/InterventionDetails/presentation/cubit/tech_marque_cubit/tech_marque_cubit.dart';
import 'package:imc/common_widgets/common_rounded_button.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';
import 'package:shimmer/shimmer.dart';

class InterventionDetailsSelectionContainer extends StatelessWidget {
  final List<String>? listOfItems;
  final String hint;
  final String? value;
  final Function(String? value)? onBtnPressed;
  const InterventionDetailsSelectionContainer({Key? key, this.listOfItems, this.value, required this.hint, this.onBtnPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => InterventionDetailsSelectionBottomSheet(
            listOfItems: listOfItems,
            value: value,
            onButtonPressed: (String? bottomSheetValue) {
              if (onBtnPressed != null) {
                onBtnPressed!(bottomSheetValue);
              }
              Navigator.pop(context);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(border: Border.all(color: Colors.black26), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "${(value == "" || value == null) ? hint : value}",
                style: TextStyle(
                    color: (value == "" || value == null) ? Colors.grey : Colors.black,
                    fontWeight: value == null ? FontWeight.normal : FontWeight.bold),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
              size: 30.sp,
            )
          ],
        ),
      ),
    );
  }
}

class InterventionDetailsSelectionBottomSheet extends StatefulWidget {
  final List<String>? listOfItems;
  final String? btnText;
  final String? value;
  final Function(String? selectedValue)? onButtonPressed;
  const InterventionDetailsSelectionBottomSheet({Key? key, required this.listOfItems, this.btnText, this.onButtonPressed, this.value})
      : super(key: key);

  @override
  State<InterventionDetailsSelectionBottomSheet> createState() => _InterventionDetailsSelectionBottomSheetState();
}

class _InterventionDetailsSelectionBottomSheetState extends State<InterventionDetailsSelectionBottomSheet> {
  String? selectedItem;
  List<String?>? _listOfItems;

  @override
  void initState() {
    super.initState();
    final _bloc = BlocProvider.of<TechMarqueCubit>(context);

    // setting selectedItem as value coming from widget
    selectedItem = widget.value;
    _listOfItems = widget.listOfItems;

    //setting initial [selectedItem] from first item of the list
    // if (widget.listOfItems != null && (selectedItem == null || selectedItem == "") ) {
    //   selectedItem = widget.listOfItems!.first;
    // }
    if (widget.listOfItems != null  ) {
      selectedItem = widget.listOfItems!.first;
    }

    if (_listOfItems == null) {
      // fetching list of tech marque from bloc
      _bloc.getListOfTechMarque();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      height: 0.45.sh,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      child: Column(
        children: [
          SizedBox(height: .02.sh),
          Container(height: 7, width: 0.4.sw, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(15))),
          SizedBox(height: .02.sh),
          BlocConsumer<TechMarqueCubit, TechMarqueState>(
            listener: (context, state) {
              if (state is TechMarqueFetched) {
                List<techMarque.Records>? _listOfTechMarque = state.techMarque;
                if (_listOfTechMarque != null) {
                  _listOfItems = _listOfTechMarque.map((record) => record.title).toList();
                  selectedItem = _listOfItems!.first;
                }
              }
            },
            builder: (context, state) {
              if (state is FetchingTechMarqueError) {
                return Center(child: AppRegularText("${state.errorMessage}"));
              } else if (state is FetchingTechMarque) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            width: 1.sw,
                            height: 14,
                            color: Colors.grey,
                          )),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade300,
                          child: Container(
                            width: 0.6.sw,
                            height: 14,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: Column(
                    children: [
                      if (_listOfItems != null)
                        Expanded(
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 60,
                            scrollController: FixedExtentScrollController(initialItem: 0),
                            onSelectedItemChanged: (int index) {
                              setState(() {
                                selectedItem = _listOfItems![index];
                              });
                            },
                            children: _listOfItems!.map((e) {
                              return Center(
                                  child: Text(
                                    "$e",
                                    textAlign: TextAlign.center,
                                  ));
                            }).toList(),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        width: 1.sw,
                        child: CommonRoundedButton(
                            btnText: appLocalizations.translate("done"),
                            textColor: Colors.white,
                            color: AppColor.kPrimaryColor,
                            onPressed: () {
                              if (widget.onButtonPressed != null) {
                                widget.onButtonPressed!(selectedItem);
                              }
                            }),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          SizedBox(height: 0.02.sh)
        ],
      ),
    );
  }
}