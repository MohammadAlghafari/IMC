import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/utils/app_localizations.dart';

class CustomDetailsListTile extends StatefulWidget {
  final String? title;
  final String? description;
  const CustomDetailsListTile({Key? key, this.title, this.description}) : super(key: key);

  @override
  State<CustomDetailsListTile> createState() => _CustomDetailsListTileState();
}

class _CustomDetailsListTileState extends State<CustomDetailsListTile> {
  String? _descriptionValue;

  @override
  void initState() {
    super.initState();
    convertTrueFalse();
  }

  ///[convertTrueFalse]converting true, false values to yes, no values
  void convertTrueFalse() {
    if (widget.description != null && widget.description == "true") {
      _descriptionValue = "yes";
    } else if (widget.description != null && widget.description == "false") {
      _descriptionValue = "no";
    } else {
      _descriptionValue = widget.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    //Using translated values in place of 'yes' , 'no'
    if (_descriptionValue == "yes") {
      _descriptionValue = appLocalizations.translate("yes");
    } else if (_descriptionValue == "no") {
      _descriptionValue = appLocalizations.translate("no");
    } else if (_descriptionValue == "Defective" || _descriptionValue == "defective") {
      _descriptionValue = appLocalizations.translate("defective");
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: AppBoldText(widget.title.toString(), color: AppColor.kPrimaryColor, fontSize: 13.sp),),
          Expanded(child:AppRegularText(_descriptionValue.toString(), color: AppColor.kBlackColor, fontSize: 15.sp, textAlign: TextAlign.right,),)
        ],
      ),
    );
  }
}