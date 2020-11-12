import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/common/screenutil/screenutil.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/themes/theme_color.dart';

class Seperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth / 2,
      height: Sizes.dimen_2.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.vulcan,
          ],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
