import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  MainTitle({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/question_mark.png'),
        SizedBox(width: 15),
        Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
