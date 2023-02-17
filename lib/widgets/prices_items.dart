import 'package:flutter/material.dart';

import '../Model/currency.dart';

class PricesItems extends StatelessWidget {
  PricesItems({required this.currency, required this.position});

  List<Currency> currency;
  int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            currency[position].title!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            currency[position].price!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            currency[position].changes!,
            style: currency[position].status == 'n'
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
