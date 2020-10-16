import 'package:flutter/foundation.dart';
import 'package:poker/models/user.dart';
import 'package:poker/data/players.dart';

import '../models/user.dart';

class GameProvider extends ChangeNotifier {
  List _games = [];

  List get games => _games;

  void addGame(List<User> users) {
    List<User> tempList = [];
    for (User usr in users) {
      tempList.add(User(name: usr.name, price: usr.price));
    }
    _games.add(tempList);
    notifyListeners();
  }

  void addFirstInstance(List<User> users) {
    _games.add(users);
    notifyListeners();
  }

  void deleteGameWithIndex(int index) {
    _games.removeAt(index);
    notifyListeners();
  }
}
