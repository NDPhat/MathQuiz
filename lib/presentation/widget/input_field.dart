import 'package:flutter/material.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';



import 'input_field_container.dart';

class InputField extends StatelessWidget {
  String hintText;
  double size;
  String? validateText;
  bool? isHidden;
  ValueChanged<String>? onChanged;
  bool? hasError;
  InputField({
    Key? key,
    required this.hintText,
    required this.size,
    this.validateText,
    this.isHidden,
    this.hasError,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputFieldContainer(
        size: size,
        validateText: validateText == null ? '' : validateText!,
        isHidden: isHidden == null ? false : isHidden!,
        child: TextField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: s20f700ColorMBlue,
          decoration: InputDecoration(
            labelText: hintText,
            counterText: '',
            enabledBorder: hasError == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorErrorPrimary))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorSystemWhite)),
            fillColor: colorBGInput,
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(color: colorGreyTetiary)
            ),
            focusedBorder: hasError == true
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorErrorPrimary))
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: colorMainBlue)),
            filled: true,
            contentPadding: const EdgeInsets.only(
                bottom: 15.0, left: 25.0, right: 15, top: 15),
          ),
          onChanged: onChanged,
        ));
  }
}
