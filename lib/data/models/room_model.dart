import 'package:poker/data/models/round_model.dart';

class RoomModel {
  int id;
  String accessKey;
  List<Round> round;
  String created;

  RoomModel({this.id, this.accessKey, this.round, this.created});

  RoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessKey = json['access_key'];
    if (json['round'] != null) {
      round = new List<Round>();
      json['round'].forEach((v) {
        round.add(new Round.fromJson(v));
      });
    }
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['access_key'] = this.accessKey;
    if (this.round != null) {
      data['round'] = this.round.map((v) => v.toJson()).toList();
    }
    data['created'] = this.created;
    return data;
  }
}
