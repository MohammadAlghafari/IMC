import 'package:flutter/material.dart';
import 'package:imc/core/utils/app_localizations.dart';

class InterventionDetailsTextFieldLarge extends StatelessWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? initialText;
  final TextEditingController? textEditingController;
  const InterventionDetailsTextFieldLarge({Key? key, this.hintText, this.onChanged, this.initialText, this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText,
      minLines: 4,
      maxLines: 6,
      keyboardType: TextInputType.multiline,
      controller: textEditingController,
      onChanged: (String value){
        if(onChanged != null){
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        hintText: '${hintText ?? AppLocalizations.of(context).translate("indicate_the_reason_here")}',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
