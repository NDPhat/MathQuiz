
import 'package:flutter/material.dart';

class BottomAppIcon extends StatefulWidget {
  BottomAppIcon({Key? key,
    required this.pathImage,
    required this.text,
    required this.size, required this.color,
  })
      : super(key: key);
  final Size size;
  final String pathImage;
  final String text;
  final Color color;

  @override
  State<BottomAppIcon> createState() => _BottomAppIconState();
}

class _BottomAppIconState extends State<BottomAppIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width / 4,
      height: widget.size.height * 0.08,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.pathImage,
            color:widget.color,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
            ),
          )
        ],
      ),
    );
  }
}
