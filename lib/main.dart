import 'package:flutter/material.dart';
import 'package:poker/screens/game_screen.dart';
import 'package:poker/screens/home_screen.dart';
import 'package:poker/data/players.dart';
import 'package:poker/data/games.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlayerProivder(),
        ),
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Poker Stats Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
