import 'package:flutter/material.dart';
import 'package:poker/presentation/journeys/rounds/round_app_bar.dart';

class RoundScreen extends StatefulWidget {
  @override
  _RoundScreenState createState() => _RoundScreenState();
}

class _RoundScreenState extends State<RoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RoundAppBar(
            isAdmin: true,
          ),
          Text("Oda şifresi: deneme"),
        ],
      ),
    );
  }
}
