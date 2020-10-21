import 'package:flutter/material.dart';
import 'package:poker/data/games.dart';
import 'package:poker/data/players.dart';
import 'package:poker/models/user.dart';
import 'package:provider/provider.dart';

import '../data/games.dart';
import '../data/players.dart';
import '../data/players.dart';
import '../data/players.dart';
import '../data/players.dart';

class AddGameScreen extends StatefulWidget {
  @override
  _AddGameScreenState createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  List<User> playerPoints = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (User user in Provider.of<PlayerProivder>(context).players) {
      User willAddUser = User(name: user.name, price: -5);
      playerPoints.add(willAddUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 400.0,
              child: ListView.builder(
                itemCount: playerPoints.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      int otherPlayerPoints = 0;
                      for (User user in playerPoints) {
                        if (user.name != playerPoints[index].name) {
                          otherPlayerPoints += user.price;
                        }
                      }
                      setState(() {
                        playerPoints[index].price = otherPlayerPoints * -1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 25.0),
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black38)],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            playerPoints[index].name,
                            style: TextStyle(fontSize: 22.0),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      playerPoints[index].price -= 5;
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                playerPoints[index].price.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                              SizedBox(width: 10.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      playerPoints[index].price += 5;
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                child: Text("Kaydet"),
                color: Colors.deepOrangeAccent,
                textColor: Colors.white,
                onPressed: () {
                  for (int i = 0; i < playerPoints.length; i++) {
                    User thisUser =
                        Provider.of<PlayerProivder>(context, listen: false)
                            .players[i];
                    int newPrice = thisUser.price + playerPoints[i].price;
                    if (newPrice > 0) {
                      thisUser.price = newPrice;
                    } else {
                      Provider.of<PlayerProivder>(context, listen: false)
                          .deletePlayer(thisUser);
                    }
                  }
                  Provider.of<GameProvider>(context, listen: false).addGame(
                      Provider.of<PlayerProivder>(context, listen: false)
                          .players);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
