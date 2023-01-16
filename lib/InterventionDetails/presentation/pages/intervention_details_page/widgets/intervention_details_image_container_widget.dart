import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc/common_widgets/custom_text.dart';
import 'package:imc/core/constant/app_color.dart';
import 'package:imc/core/constant/app_icons.dart';
import 'package:imc/core/utils/image_picker_helper.dart';

class InterventionDetailsImageContainerWidget extends StatefulWidget {
  final String? title;
  final String? filePath;
  final Function(String? filePath)? onImageSelected;
  final bool disableOnTap;
  const InterventionDetailsImageContainerWidget({Key? key, this.title, this.onImageSelected, this.filePath, this.disableOnTap = false}) : super(key: key);

  @override
  State<InterventionDetailsImageContainerWidget> createState() => _InterventionDetailsImageContainerWidgetState();
}

class _InterventionDetailsImageContainerWidgetState extends State<InterventionDetailsImageContainerWidget> {

  String? filePath;


  @override
  void initState() {
    super.initState();
    filePath = widget.filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.02.sh),
      child: Column(
        children: [
          if(widget.title != null)
          AppBoldText(widget.title!, textAlign: TextAlign.center,),
          if(widget.title != null)
          const SizedBox(height: 10,),
          Stack(
            children: [
              GestureDetector(
                onTap: widget.disableOnTap == true ? null : () async{
                  FocusManager.instance.primaryFocus?.unfocus();
                    String? imagePath = await ImagePickerHelper.openBottomSheet(context);
                    if(imagePath != null){
                      setState((){
                        filePath = imagePath;
                      });

                      if(widget.onImageSelected != null){
                        widget.onImageSelected!(filePath);
                      }
                    }
                },
                child: (filePath == null || filePath == "" )?
                    // showing the dotted border container
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [15, 15],
                  radius: Radius.circular(12),
                  color: Colors.grey.shade400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 120,
                      width: 120,
                      color: Color(0xffF1F1F1),
                      child: Image.asset(AppIcons.addPhoto, scale: 2.5),
                    ),
                  ),
                ) :
                    // showing the image
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          File(filePath!),
                        )),
                    borderRadius: BorderRadius.circular(10),
                    // border:
                    // Border.all(color: Colors.black38, width: 2),
                  ),
                  //  child: Image.file(image!),
                ),
              ),
              if(filePath != null && filePath != "" && widget.disableOnTap == false)
              Transform.translate(
                offset: Offset(-10,-10),
                child: CircleAvatar(
                  backgroundColor: AppColor.kSuccessColor,
                  radius: 14.r,
                  child: Icon(Icons.check, size: 16,color: Colors.white,),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}