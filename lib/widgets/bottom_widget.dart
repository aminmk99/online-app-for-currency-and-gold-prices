import 'package:flutter/material.dart';
import 'package:test_application/buttons/bottom_button.dart';

class BottomWidget extends StatelessWidget {
  BottomWidget({required this.currency, required this.getItemsFromAPI});

  var currency;
  var getItemsFromAPI;

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
              child: BottomButton(
                text: 'بروز رسانی',
                icon: Icons.refresh_sharp,
                currency: currency,
              ),
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

  String _getTime() {
    return 'test';
  }
}
