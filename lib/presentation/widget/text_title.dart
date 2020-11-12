import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Poker Admin",
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
