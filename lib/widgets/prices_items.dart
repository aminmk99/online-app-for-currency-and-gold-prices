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
            changeEnNum2FaNum(currency[position].price.toString()),
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            changeEnNum2FaNum(
              currency[position].changes.toString(),
            ),
            style: currency[position].status == 'n'
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  String changeEnNum2FaNum(String number) {
    const enNums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const faNums = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    enNums.forEach((element) {
      number = number.replaceAll(element, faNums[enNums.indexOf(element)]);
    });

    return number;
  }
}
