import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/common/screenutil/screenutil.dart';
import 'package:poker/presentation/widget/text_title.dart';

class RoundAppBar extends StatelessWidget {
  final bool isAdmin;

  const RoundAppBar({this.isAdmin = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_6.h,
        left: Sizes.dimen_12.w,
        right: Sizes.dimen_12.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
          ),
          Hero(
            tag: 'title-hero',
            child: TextTitle(),
          ),
          if (isAdmin)
            Icon(
              Icons.add,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            )
        ],
      ),
    );
  }
}
