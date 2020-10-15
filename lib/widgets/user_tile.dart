import 'package:flutter/material.dart';
import 'package:poker/models/user.dart';

class UserTile extends StatelessWidget {
  final User user;
  final Function onPressed;

  const UserTile({this.user, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 2,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${user.name} - ${user.price.toString()}₺',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
