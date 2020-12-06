import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/data/models/round_model.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/journeys/rounds/single_item_widget.dart';

class RoundItemListWidget extends StatelessWidget {
  final List<Round> rounds;
  final Function deleteAction;

  const RoundItemListWidget({@required this.rounds, this.deleteAction});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: rounds.length,
      itemBuilder: (context, index) {
        List<Widget> _roundChildrens = [];
        int thisRound = index + 1;
        for (Item item in rounds[index].item) {
          _roundChildrens.add(
            SingleItem(
              name: item.name,
              price: item.money,
            ),
          );
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            child: Row(
              children: [
                Text(
                  thisRound.toString(),
                  style: TextStyle(fontSize: 22.sp),
                ),
                SizedBox(
                  width: Sizes.dimen_20.w,
                ),
                ..._roundChildrens,
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: Sizes.dimen_40.sp,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    deleteAction(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
