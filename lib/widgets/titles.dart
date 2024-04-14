import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  Titles({required this.title1, required this.title2, required this.title3});

  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                color: Color.fromARGB(255, 130, 130, 130),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title1,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    title2,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    title3,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            );
  }
}