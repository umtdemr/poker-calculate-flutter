import 'package:flutter/material.dart';
import 'package:poker/data/games.dart';
import 'package:poker/data/players.dart';
import 'package:poker/models/user.dart';
import 'package:poker/screens/add_game_screen.dart';
import 'package:poker/widgets/user_table.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  final String route_id = "/route";
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: Consumer2<PlayerProivder, GameProvider>(
            builder: (context, playerProvider, gameProvider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: playerProvider.players.length,
                          itemBuilder: (context, index) {
                            return UserTable(
                              name: playerProvider.players[index].name,
                              price: playerProvider.players[index].price
                                  .toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Oynanan Eller",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gameProvider.games.length,
                    itemBuilder: (context, index) {
                      List<Widget> widgets = [];
                      for (User usr in gameProvider.games[index]) {
                        widgets.add(UserTable(
                          name: usr.name,
                          price: usr.price.toString(),
                        ));
                      }
                      return Row(
                        children: widgets,
                      );
                    },
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    child: IconButton(
                      icon: Icon(
                        Icons.plus_one,
                        color: Colors.white,
                      ),
                      tooltip: "El ekle",
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: AddGameScreen(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
