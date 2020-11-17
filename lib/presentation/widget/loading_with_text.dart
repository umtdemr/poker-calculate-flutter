import 'package:flutter/material.dart';

class LoadingWithText extends StatelessWidget {
  final String loadingText;

  const LoadingWithText({this.loadingText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text(loadingText),
        ),
      ],
    );
  }
}
