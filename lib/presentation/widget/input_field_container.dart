import 'package:flutter/material.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

class InputFieldContainer extends StatelessWidget {
  final Widget child;
  final double width, height;
  final String? validateText;
  final bool? isHidden;
  final String? nameTitle;

  const InputFieldContainer({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
    this.validateText,
    this.nameTitle,
    this.isHidden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        children: [
          SizedBox(
            width: width,
            child: Text(
              nameTitle ?? "",
              style: s15f700ColorBlueMa,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          child,
          SizedBox(
            height: height * 0.01,
          ),
          Visibility(
            visible: isHidden == null ? false : isHidden!,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/error_validate.png")),
                Text(
                  validateText ?? "",
                  style: s14f400ColorErrorPro,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
