import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.text, required this.icon});

  String text;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 202, 193, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        ),
      ),
      onPressed: () => _showSnackBar(context, 'بروز رسانی با موفقیت انجام شد'),
      icon: Icon(icon, color: Colors.black, size: 27),
      label: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
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
}
