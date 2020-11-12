import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/presentation/widget/seperator.dart';
import 'package:poker/presentation/themes/theme_text.dart';
import 'package:poker/common/extensions/size_extensions.dart';

class TitleWithSeperatorWidget extends StatelessWidget {
  final String title;

  const TitleWithSeperatorWidget({this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.royalBlueSubtitle1,
        ),
        SizedBox(width: Sizes.dimen_18.w),
        Seperator(),
      ],
    );
  }
}
