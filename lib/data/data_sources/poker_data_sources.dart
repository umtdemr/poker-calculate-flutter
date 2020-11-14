import 'package:poker/data/core/api_client.dart';
import 'package:poker/data/models/room_model.dart';
import 'package:poker/data/models/round_model.dart';

abstract class PokerRemoteDataSource {
  Future<List<Round>> getRounds(String accesKey);
  Future<bool> addRound(String accesKey, List users);
}

class PokerRemoteDataSourceImpl extends PokerRemoteDataSource {
  final ApiClient _client;

  PokerRemoteDataSourceImpl(this._client);

  @override
  Future<List<Round>> getRounds(String accesKey) async {
    final response = await _client.get('room/?access_key=$accesKey');
    final rounds = RoomModel.fromJson(response[0]).round;
    print(rounds);
    return rounds;
  }

  @override
  Future<bool> addRound(String accesKey, List users) async {
    final response = await _client.post(
        'round', <String, dynamic>{"users": users, "access_key": accesKey});
    return true;
  }
}
