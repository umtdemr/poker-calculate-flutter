import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/journeys/rounds/add_round_screen.dart';
import 'package:poker/presentation/journeys/rounds/round_app_bar.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/journeys/rounds/round_item_list_widget.dart';
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
      body: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is RoomLoaded) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text("Poker admin"),
                  centerTitle: true,
                  expandedHeight: Sizes.dimen_40.h,
                  floating: true,
                  pinned: true,
                  elevation: 3.2,
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: Sizes.dimen_16.h,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddRoundScreen(items: state.rounds.last.item),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.refresh,
                        size: Sizes.dimen_16.h,
                      ),
                      onPressed: () {
                        BlocProvider.of<RoomBloc>(context)
                            .add(EnterRoomEvent(state.accessKey));
                      },
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: null,
                    child: Text("Oda şifresi: ${state.accessKey}"),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
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
                          return Text("is room loaded");
                        },
                      ),
                      SizedBox(
                        height: Sizes.dimen_18.h,
                      ),
                      TitleWithSeperatorWidget(
                        title: "Oynanan eller",
                      ),
                      Container(
                        height: Sizes.dimen_200.h,
                        child: RoundItemListWidget(
                          rounds: state.rounds,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Text("Oluyo bi şeyler");
        },
      ),
    );
  }
}
