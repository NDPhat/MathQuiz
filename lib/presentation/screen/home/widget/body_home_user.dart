import 'package:flutter/material.dart';

class HomeBodyUser extends StatelessWidget {
  const HomeBodyUser({Key? key, required this.myPage}) : super(key: key);
  final PageController myPage;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
          left: size.width * 0.05,
          right: size.width * 0.05,
          top: size.height * 0.07),
      child: PageView(
          controller: myPage,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            // HomeDetailBody(),
          ]),
    ); // Comment this if you need to use Swipe.
  }
}
