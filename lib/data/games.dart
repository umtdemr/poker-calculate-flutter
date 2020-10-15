import 'package:flutter/foundation.dart';
import 'package:poker/models/user.dart';
import 'package:poker/data/players.dart';

class GameProvider extends ChangeNotifier {
  List _games = [];

  List get games => _games;

  void addGame(List<User> users) {
    _games.add(users);
    notifyListeners();
  }

  void addFirstInstance(List<User> users) {
    _games.add(users);
    notifyListeners();
  }
}
