import 'package:flutter/material.dart';

import '../cons/text_style.dart';


class InputFieldContainer extends StatelessWidget {
  final Widget child;
  final double size;
  final String? validateText;
  final bool? isHidden;

  const InputFieldContainer({
    Key? key,
    required this.child,
    required this.size,
    this.validateText,
    this.isHidden,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          child,
          const SizedBox(
            height: 4,
          ),
          Visibility(
            visible: isHidden == null ? false : isHidden!,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/image/error_validate.png")),
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
