import 'package:flutter/material.dart';
import 'package:poker/common/constants/size_constants.dart';
import 'package:poker/presentation/themes/theme_color.dart';
import 'package:poker/common/extensions/size_extensions.dart';
import 'package:poker/presentation/themes/theme_text.dart';
import 'package:poker/presentation/widget/button.dart';
import 'package:poker/presentation/widget/seperator.dart';
import 'package:poker/presentation/widget/text_field.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(
              "Poker Admin",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextfieldWidget(
                    hintText: "Oda giriş şifresi",
                    onChange: (value) {
                      print(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Button(
            onPressed: () {},
            text: "Odaya Katıl",
          ),
          SizedBox(
            height: Sizes.dimen_12.h,
          ),
          Seperator(),
          SizedBox(
            height: Sizes.dimen_12.h,
          ),
          Button(
            onPressed: () {},
            text: "Oda Oluştur",
          ),
        ],
      ),
    );
  }
}
