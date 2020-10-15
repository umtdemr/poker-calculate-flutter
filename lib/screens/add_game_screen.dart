import 'package:flutter/material.dart';
import 'package:poker/data/players.dart';
import 'package:poker/models/user.dart';
import 'package:provider/provider.dart';

class AddGameScreen extends StatefulWidget {
  @override
  _AddGameScreenState createState() => _AddGameScreenState();
}

class _AddGameScreenState extends State<AddGameScreen> {
  int denemePoint = -5;
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
          children: [
            Container(
              height: 250.0,
              child: ListView.builder(
                itemCount: Provider.of<PlayerProivder>(context).players.length,
                itemBuilder: (context, index) {
                  int this_point = 5;
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black38)],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Provider.of<PlayerProivder>(context)
                              .players[index]
                              .name,
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
                                    denemePoint -= 5;
                                    print("selam" + denemePoint.toString());
                                  });
                                },
                                icon: Icon(Icons.remove),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              this_point.toString(),
                              style: TextStyle(fontSize: 40.0),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green, shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    this_point = this_point + 5;
                                    print(this_point);
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
                  );
                },
              ),
            ),
            RaisedButton(
              child: Text("Kaydet"),
            ),
          ],
        ),
      ),
    );
  }
}
