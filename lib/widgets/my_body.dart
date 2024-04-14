import 'package:flutter/material.dart';
import 'package:test_application/widgets/main_title.dart';
import 'package:test_application/widgets/titles.dart';

import 'package:test_application/widgets/bottom_widget.dart';
import 'my_list_view_separated.dart';

class MyBody extends StatelessWidget {
  MyBody({required this.currency, required this.getItemsFromAPI});

  final currency;

  final getItemsFromAPI;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 25),
              MainTitle(text: 'نرخ ارز آزاد چیست؟'),
              SizedBox(height: 20),
              Text(
                'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 25),
              Titles(title1: 'نام آزاد ارز', title2: 'قیمت', title3: 'قیمت',),
              SizedBox(height: 10),
              MyListViewSeparated(currency: currency, getItemsFromAPI: getItemsFromAPI),
              BottomWidget(currency: currency, getItemsFromAPI: getItemsFromAPI),
            ],
          ),
        ),
      );
  }
}