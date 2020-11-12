import 'package:poker/data/models/round_item_model.dart';
import 'package:poker/domain/entities/round_entity.dart';

class Round extends RoundEntity {
  final int id;
  final int room;
  final List<Item> item;
  final String created;

  Round({this.id, this.room, this.item, this.created})
      : super(
          id: id,
          item: item,
        );

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      id: json['id'],
      room: json['room'],
      item: _items(json),
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room'] = this.room;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    data['created'] = this.created;
    return data;
  }
}

_items(Map<String, dynamic> json) {
  print(json["item"]);
  if (json['item'] != null) {
    final item = new List<Item>();
    json['item'].forEach((v) {
      item.add(new Item.fromJson(v));
    });
    return item;
  }
}
