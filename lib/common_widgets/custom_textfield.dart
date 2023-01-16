import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imc/core/constant/app_color.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.controller,
      this.input,
      this.label = '',
      this.maxLines,
      this.fieldHeight = 45,
      this.focusNode,
      this.hintText,
      this.inputFormatters,
      this.onChanged,
      this.onTap,
      this.initialValue,
      this.readOnly = false,
      this.suffix,
      this.prefixIcon = '',
      this.suffixVisibility = false,
      this.obscureText = false,
      this.validate});

  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final TextInputType? input;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final String? prefixIcon;
  final int? maxLines;
  final double fieldHeight;
  final FocusNode? focusNode;
  final String? hintText;
  final Function()? onTap;
  final String? initialValue;
  final bool readOnly;
  final Widget? suffix;
  bool suffixVisibility;
  bool obscureText;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            validator: widget.validate,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            cursorColor: AppColor.kRegularTextColor,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.input,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            inputFormatters: widget.inputFormatters,
            style: TextStyle(
                color: AppColor.kBlackColor,
                fontFamily: 'Regular',
                fontSize: 15),
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    width: 10,
                    decoration: BoxDecoration(
                        color: AppColor.kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.only(top: 18),
                suffixIcon: widget.suffixVisibility == true
                    ? IconButton(
                        icon: widget.obscureText == true
                            ? Icon(Icons.remove_red_eye,
                                size: 20, color: Colors.grey)
                            : Icon(Icons.remove_red_eye_outlined,
                                size: 20, color: Colors.grey),
                        onPressed: toggle)
                    : null,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: AppColor.kRegularTextColor,
                    fontFamily: 'Regular',
                    fontSize: 13),
                //contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none)))
      ],
    );
  }
}
