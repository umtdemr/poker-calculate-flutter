import 'package:flutter/material.dart';
import 'package:poker/data/data_sources/poker_data_sources.dart';
import 'package:poker/di/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokerRemoteDataSource _pokerRemoteDataSource =
      PokerRemoteDataSourceImpl(getItInstance());
  @override
  void initState() {
    super.initState();
    _pokerRemoteDataSource.getRounds("deneme");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Text(
          "selam",
        ),
      ),
    );
  }
}
