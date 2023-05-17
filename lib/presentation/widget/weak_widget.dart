import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../application/cons/color.dart';
import '../../application/cons/text_style.dart';

import 'package:math/data/model/data_weak.dart';

class WeakWidget extends StatelessWidget {
  const WeakWidget(
      {Key? key, required this.onTap, required this.size, required this.data})
      : super(key: key);
  final VoidCallback onTap;
  final Size size;
  final DataWeak data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  bottom: size.height * 0.01,
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: colorBlueQuaternery,
                  child: Center(
                      child: Text(
                    'Weak ${data.weak}',
                    style: s16f700ColorError,
                  )),
                ),
              ),
              RatingBar.builder(
                initialRating: data.score ?? 3,
                minRating: 1,
                itemSize: 18,
                direction: Axis.horizontal,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
