import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import '../Model/currency.dart';
import '../widgets/add_items.dart';
import '../widgets/prices_items.dart';

typedef FutureCallback = Future<void> Function();

class BottomButton extends StatefulWidget {
  BottomButton({
    required this.text,
    required this.icon,
    required this.currency,
    required this.getItemsFromAPI2
  });

  

  String text;
  IconData icon;
  var currency;
  var lastUpdated;
  FutureCallback getItemsFromAPI2; 

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
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
      onPressed: () {
        widget.currency.clear();
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: widget.currency.length,
                itemBuilder: (BuildContext context, int pos) {
                  print('list view');
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child:
                        PricesItems(currency: widget.currency, position: pos),
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
          future: widget.getItemsFromAPI2(),
        );
      },
      icon: Icon(widget.icon, color: Colors.black, size: 27),
      label: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Text(
          widget.text,
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
}
