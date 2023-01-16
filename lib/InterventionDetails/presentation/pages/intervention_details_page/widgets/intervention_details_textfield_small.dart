import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InterventionDetailsTextFieldSmall extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String? label;
  final String? initialText;
  final TextInputType? keyboardType;
  const InterventionDetailsTextFieldSmall({Key? key, this.onChanged, required this.hintText, this.label, this.initialText,  this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          initialValue: initialText,
            inputFormatters: [
              if(keyboardType == TextInputType.number)
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: "$hintText",
              labelText: label,
              hintStyle: TextStyle(color: Colors.black26),
              border: InputBorder.none,
          ),
          keyboardType: keyboardType,
          onChanged: (String value){
            if(onChanged != null){
              onChanged!(value);
            }
          },
        ));
  }
}
