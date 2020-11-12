import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/presentation/themes/theme_text.dart';

class SingleItem extends StatelessWidget {
  final String name;
  final double price;

  const SingleItem({this.name, this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: Sizes.dimen_18.w,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.royalBlue, AppColor.vulcan],
        ),
        borderRadius: BorderRadius.circular(Sizes.dimen_12.sp),
      ),
      padding: EdgeInsets.all(Sizes.dimen_18.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            price.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.incrementedText,
          ),
        ],
      ),
    );
  }
}
