import 'package:flutter/material.dart';

import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';
import 'input_field_container.dart';

class LoginInputField extends StatelessWidget {
  String hintText;
  double width, height;
  String validateText;
  bool isHidden;
  VoidCallback? clickIcon;
  Icon? icon;
  Icon? iconRight;
  ValueChanged<String>? onChanged;
  bool hasError;
  bool? showValue;

  LoginInputField(
      {Key? key,
      required this.hintText,
      required this.width,
      required this.height,
      required this.validateText,
      required this.isHidden,
      this.icon,
      required this.hasError,
      this.onChanged,
      this.clickIcon,
      this.iconRight,
      this.showValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputFieldContainer(
        width: width,
        height: height,
        validateText: validateText == null ? '' : validateText!,
        isHidden: isHidden == null ? false : isHidden!,
        child: TextField(
          textInputAction: TextInputAction.next,
          style: s16f700ColorGreyTe,
          obscureText: showValue ?? false,
          decoration: InputDecoration(
            prefixIcon: icon ?? Container(),
            labelText: hintText,
            suffixIcon: IconButton(
                onPressed: clickIcon, icon: iconRight ?? Container()),
            fillColor: colorBGInput,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black)),
            filled: true,
            contentPadding: const EdgeInsets.only(
                bottom: 40.0, left: 25.0, right: 15, top: 40),
          ),
          onChanged: onChanged,
        ));
  }
}
