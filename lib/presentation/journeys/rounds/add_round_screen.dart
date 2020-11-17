import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/presentation/blocs/bloc/room_bloc.dart';
import 'package:poker/presentation/journeys/rounds/add_round_single_widget.dart';
import 'package:poker/presentation/widget/button.dart';
import 'package:poker/presentation/widget/loading_with_text.dart';

class AddRoundScreen extends StatefulWidget {
  final List<Item> items;

  const AddRoundScreen({Key key, this.items}) : super(key: key);
  @override
  _AddRoundScreenState createState() => _AddRoundScreenState();
}

class _AddRoundScreenState extends State<AddRoundScreen> {
  List users = [];
  @override
  void initState() {
    for (Item item in widget.items) {
      users.add(
        {
          "name": item.name,
          "current": int.parse(item.money.split(".")[0]),
          "process": -5
        },
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RoomBloc, RoomState>(
        listener: (context, state) {
          if (state is RoundAddedState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is RoomLoaded) {
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
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return AddRoundSingleWidget(
                            name: users[index]["name"],
                            money: users[index]["money"],
                            process: users[index]["process"],
                            onChange: (type) {
                              setState(() {
                                if (type == "decremented") {
                                  users[index]["process"] -= 5;
                                } else if (type == "incremented") {
                                  users[index]["process"] += 5;
                                }
                              });
                            },
                            longPress: () {
                              int otherTotals = 0;
                              for (var user in users) {
                                if (user["name"] != users[index]["name"]) {
                                  otherTotals += user["process"];
                                }
                              }
                              otherTotals *= -1;
                              setState(() {
                                users[index]["process"] = otherTotals;
                              });
                            },
                          );
                        },
                      ),
                      Button(
                        text: "Kaydet",
                        onPressed: () {
                          List newUsers = [];
                          for (var user in users) {
                            newUsers.add(
                              {
                                "name": user["name"],
                                "money": user["current"] + user["process"]
                              },
                            );
                          }
                          BlocProvider.of<RoomBloc>(context).add(
                            AddRoundEvent(
                              accesKey: state.accessKey,
                              users: newUsers,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is RoundAddingState) {
            return LoadingWithText(
              loadingText: "Ronud ekleniyor. lütfen bekleyin...",
            );
          }
          return LoadingWithText(
            loadingText: "İşlem bekleniyor...",
          );
        },
      ),
    );
  }
}
