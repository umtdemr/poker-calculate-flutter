import 'package:poker/data/core/api_client.dart';
import 'package:poker/data/models/room_model.dart';
import 'package:poker/data/models/round_model.dart';

abstract class PokerRemoteDataSource {
  Future<List<Round>> getRounds(String accesKey);
  Future<bool> addRound(String accesKey, List users);
  Future<String> createRoom(List users);
}

class PokerRemoteDataSourceImpl extends PokerRemoteDataSource {
  final ApiClient _client;

  PokerRemoteDataSourceImpl(this._client);

  @override
  Future<List<Round>> getRounds(String accesKey) async {
    final response = await _client.get('room/?access_key=$accesKey');
    final rounds = RoomModel.fromJson(response[0]).round;
    return rounds;
  }

  @override
  Future<bool> addRound(String accesKey, List users) async {
    final response = await _client.post(
      'round/',
      <String, dynamic>{"access_key": accesKey},
    );

    int roundId = response["id"];

    for (int i = 0; i < users.length; i++) {
      await _client.post(
        'rounditem/',
        <String, dynamic>{
          'name': users[i]["name"],
          'money': users[i]["money"],
          'item': roundId
        },
      );
    }

    return true;
  }

  @override
  Future<String> createRoom(List users) async {
    final roomResponse =
        await _client.post('room/', <String, dynamic>{"generate": true});
    final String accessKey = roomResponse["access_key"];

    await addRound(accessKey, users);

    return accessKey;
  }
}
