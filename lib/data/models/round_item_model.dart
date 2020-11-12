class Item {
  int id;
  String name;
  String money;
  String created;
  String control;
  int item;

  Item({this.id, this.name, this.money, this.created, this.control, this.item});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    money = json['money'];
    created = json['created'];
    control = json['control'];
    item = json['item'];
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
}
