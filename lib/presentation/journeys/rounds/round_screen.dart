import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/journeys/rounds/round_app_bar.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/journeys/rounds/single_item_widget.dart';
import 'package:poker/presentation/journeys/rounds/title_with_seperator_widget.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/presentation/themes/theme_text.dart';
import 'package:poker/presentation/widget/seperator.dart';

class RoundScreen extends StatefulWidget {
  @override
  _RoundScreenState createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RoundAppBar(
              isAdmin: true,
            ),
            Text(
              "şifre: deneme",
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: Sizes.dimen_12.h,
            ),
            BlocBuilder<RoomBloc, RoomState>(
              builder: (context, state) {
                if (state is RoomLoaded) {
                  return Column(
                    children: [
                      TitleWithSeperatorWidget(
                        title: "Güncel Durum",
                      ),
                      SizedBox(
                        height: Sizes.dimen_6.h,
                      ),
                      BlocBuilder<RoomBloc, RoomState>(
                        builder: (context, state) {
                          if (state is RoomLoaded) {
                            List<Item> _items = state.rounds.last.item;
                            List<Widget> _childrens = [];
                            for (Item item in _items) {
                              _childrens.add(
                                SingleItem(
                                  name: item.name,
                                  price: 230.0,
                                ),
                              );
                            }
                            return SingleChildScrollView(
                              child: Row(
                                children: _childrens,
                              ),
                            );
                          }
                          return Text("El bilgisi yok");
                        },
                      ),
                      SizedBox(
                        height: Sizes.dimen_20.h,
                      ),
                      TitleWithSeperatorWidget(
                        title: "Oynanan eller",
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.rounds.length,
                        itemBuilder: (context, index) {
                          List<Widget> _roundChildrens = [];
                          int thisRound = index + 1;
                          for (Item item in state.rounds[index].item) {
                            _roundChildrens.add(
                              SingleItem(
                                name: item.name,
                                price: 222.2,
                              ),
                            );
                          }
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Sizes.dimen_6.h),
                              child: Row(
                                children: [
                                  Text(
                                    thisRound.toString(),
                                    style: TextStyle(fontSize: 35.2),
                                  ),
                                  SizedBox(
                                    width: Sizes.dimen_20.w,
                                  ),
                                  ..._roundChildrens,
                                  Icon(
                                    Icons.close,
                                    size: Sizes.dimen_40.sp,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
                return Text("selam");
              },
            ),
          ],
        ),
      ),
    );
  }
}
