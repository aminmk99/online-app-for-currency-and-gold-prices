import 'package:flutter/material.dart';
import 'package:test_application/widgets/add_items.dart';
import 'package:test_application/widgets/prices_items.dart';

class MyListViewSeparated extends StatelessWidget {
  MyListViewSeparated({required this.currency, required this.getItemsFromAPI});

  var currency;

  var getItemsFromAPI;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/2.4,
      // height: 350,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
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
            );
          } //
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: getItemsFromAPI(),
      ),
    );
  }
}
