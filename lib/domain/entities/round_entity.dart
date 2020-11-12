import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:poker/data/models/round_item_model.dart';

class RoundEntity extends Equatable {
  final int id;
  final List<Item> item;

  RoundEntity({
    @required this.id,
    @required this.item,
  }) : assert(id != null, "round id cannot be null");

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}
