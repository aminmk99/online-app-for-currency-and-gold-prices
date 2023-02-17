import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_application/widgets/add_items.dart';
import 'package:test_application/widgets/prices_items.dart';

class MyListViewSeparated extends StatelessWidget {
  MyListViewSeparated({required this.currency});

  var currency;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: currency.length,
        itemBuilder: (BuildContext context, int pos) {
          print('list view');
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: PricesItems(currency: currency, position: pos),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          if (index % 9 == 0) {
            return AddItems(
              text: 'تبلیغات',
            );
          } //
          else {
            return SizedBox(width: 0);
          }
        },
      ),
    );
  }
}
