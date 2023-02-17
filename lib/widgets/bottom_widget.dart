import 'package:flutter/material.dart';
import 'package:test_application/buttons/bottom_button.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 232, 232, 232),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 52,
              child: BottomButton(),
            ),
            SizedBox(width: 30),
            Text(
              'آخرین بروز رسانی    ${_getTime()}',
              style: TextStyle(
                fontFamily: 'dana',
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: Theme.of(context).textTheme.headline1),
          backgroundColor: Colors.green),
    );
  }

  String _getTime() {
    return 'test';
  }
}
