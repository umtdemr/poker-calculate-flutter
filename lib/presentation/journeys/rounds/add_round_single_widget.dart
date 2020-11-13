import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/common/extensions/size_extensions.dart';

class AddRoundSingleWidget extends StatelessWidget {
  final String name;
  final num money;
  final int process;
  final Function onChange;
  final Function longPress;

  const AddRoundSingleWidget(
      {this.name, this.money, this.process, this.onChange, this.longPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
        margin: EdgeInsets.symmetric(
          vertical: Sizes.dimen_6.h,
          horizontal: Sizes.dimen_12.w,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.violet,
              AppColor.vulcan,
            ],
          ),
          borderRadius: BorderRadius.circular(Sizes.dimen_12.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: Sizes.dimen_16.h,
                    color: AppColor.violet,
                  ),
                  onPressed: () => onChange("decremented"),
                ),
                SizedBox(width: Sizes.dimen_6.w),
                Text(
                  process.toString(),
                  style: TextStyle(
                      color: Colors.white, fontSize: Sizes.dimen_40.sp),
                ),
                SizedBox(width: Sizes.dimen_6.w),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    size: Sizes.dimen_16.h,
                    color: AppColor.violet,
                  ),
                  onPressed: () => onChange("incremented"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
