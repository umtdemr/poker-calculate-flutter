import 'package:flutter/foundation.dart';
import 'package:poker/models/user.dart';

class PlayerProivder extends ChangeNotifier {
  List<User> _players = [];

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
