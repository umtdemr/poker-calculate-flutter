import 'package:flutter/material.dart';

class UserTable extends StatelessWidget {
  String name;
  String price;
  UserTable({this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100.0,
          height: 50.0,
          decoration:
              BoxDecoration(border: Border.all(color: Color(0xFF999999))),
          child: Text(
            this.name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Container(
          width: 100.0,
          height: 22.0,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF999999)),
          ),
          child: Text(
            this.price,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
