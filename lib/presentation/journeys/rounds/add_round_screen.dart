import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/journeys/rounds/add_round_single_widget.dart';

class AddRoundScreen extends StatefulWidget {
  @override
  _AddRoundScreenState createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen> {
  List users = [];
  @override
  Widget build(BuildContext context) {
    users = [];
    return Scaffold(
      body: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          if (state is RoomLoaded) {
            for (Item item in state.rounds.last.item) {
              users.add(
                {"name": item.name, "current": item.money, "process": -5},
              );
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text("Round ekle"),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.rounds.last.item.length,
                        itemBuilder: (context, index) {
                          return AddRoundSingleWidget(
                            name: users[index]["name"],
                            money: users[index]["money"],
                            process: users[index]["process"],
                            onChange: (type) {
                              setState(() {
                                if (type == "decremented") {
                                  print("azalt" +
                                      users[index]["process"].toString());
                                  users[index]["process"] -= 5;
                                }
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Text("oluyo bi şeyler");
        },
      ),
    );
  }
}
