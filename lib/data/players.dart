import 'package:flutter/foundation.dart';
import 'package:poker/models/user.dart';

import '../models/user.dart';

class PlayerProivder extends ChangeNotifier {
  List<User> _players = [
    User(name: "Ümit", price: 100),
    User(name: "Fatih", price: 100),
    User(name: "Kadir", price: 100),
    User(name: "Mert", price: 100),
  ];

  List<User> get players => _players;

  void addPlayer(User user) {
    _players.insert(0, user);
    notifyListeners();
  }

  void deletePlayer(User user) {
    _players.remove(user);
    notifyListeners();
  }

  void setAllPrice(int price) {
    _players.map((e) {
      e.price = price;
      return e;
    }).toList();
    notifyListeners();
  }
}
