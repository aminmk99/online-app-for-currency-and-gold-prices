import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_application/buttons/bottom_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import '../Model/currency.dart';

class BottomWidget extends StatefulWidget {
  BottomWidget({required this.currency, required this.getItemsFromAPI});

  var currency;
  var getItemsFromAPI;

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  DateTime now = DateTime.now();

  late var lastTime = DateFormat('kk:mm:ss').format(now);

  double magnitude = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, top: 16),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height/14.5,
        // height: 52,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 232, 232, 232),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/14.5,
              // height: 52,
              child: BottomButton(
                text: 'بروز رسانی',
                icon: Icons.refresh_sharp,
                currency: widget.currency,
                getItemsFromAPI2: getItemsFromAPI,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width/20),
            Text(
              'آخرین بروز رسانی    ${lastTime}',
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

  Future getItemsFromAPI() async {

    DateTime now = DateTime.now();

    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";

    var value = await http.get(Uri.parse(url));

    developer.log(
      value.statusCode.toString(),
      name: 'getResponse',
    ); //get log instead of printing
    if (widget.currency.isEmpty) {
      if (value.statusCode == 200) {
        List jsonList = convert.jsonDecode(value.body);
        developer.log('before snack bar', name: 'my log');
        setState(() {
          lastTime = (DateFormat('kk:mm:ss').format(now)).toString();
        });
        print('************************************************');
        print(lastTime);
        _showSnackBar(context, 'بروز رسانی با موفیت انجام شد');
        if (jsonList.length != 0) {
          for (var i = 0; i < jsonList.length; i++) {
            setState(() {
              widget.currency.add(
                Currency(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  changes: jsonList[i]["changes"],
                  status: jsonList[i]["status"],
                ),
              );
            });
          }
        }
      }
    }
    return value;
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: Theme.of(context).textTheme.headline1),
          backgroundColor: Colors.green),
    );
  }

  String _getTime() {
    DateTime now = DateTime.now();

    return (DateFormat('kk:mm:ss').format(now)).toString();
  }
}
