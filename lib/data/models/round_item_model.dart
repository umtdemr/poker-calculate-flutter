import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String money;
  final String created;
  final String control;
  final int item;

  Item({this.id, this.name, this.money, this.created, this.control, this.item});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      money: json['money'],
      created: json['created'],
      control: json['control'],
      item: json['item'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['money'] = this.money;
    data['created'] = this.created;
    data['control'] = this.control;
    data['item'] = this.item;
    return data;
  }

  @override
  List<Object> get props => [id, name, control];

  @override
  bool get stringify => true;
}
