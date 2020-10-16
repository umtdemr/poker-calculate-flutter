import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker/data/games.dart';
import 'package:poker/data/players.dart';
import 'package:poker/models/user.dart';
import 'package:poker/screens/game_screen.dart';
import 'package:poker/widgets/user_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName;
  int _price = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POKER PUAN"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: Consumer2<PlayerProivder, GameProvider>(
            builder: (context, playerProvider, gameProvider, child) => Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: 'Kumbarbaz adı'),
                          onChanged: (val) {
                            setState(() {
                              _userName = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 15.0),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          child: Text("Ekle"),
                          onPressed: () {
                            User user =
                                new User(name: _userName, price: _price);
                            playerProvider.addPlayer(user);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Kumarbazlar",
                  style: TextStyle(fontSize: 24.0),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: playerProvider.players.length,
                    itemBuilder: (context, index) {
                      return UserTile(
                        user: playerProvider.players[index],
                        onPressed: () {
                          playerProvider
                              .deletePlayer(playerProvider.players[index]);
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Başlangıç parası'),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
                        _price = int.parse(val);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("oyuna başla"),
                    hoverColor: Colors.red,
                    color: Color(0xFFF2F2F2),
                    onPressed: () {
                      playerProvider.setAllPrice(_price);
                      gameProvider.addGame(playerProvider.players);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GameScreen()),
                      );
                    },
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
