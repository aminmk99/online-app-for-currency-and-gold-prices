import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import '../Model/currency.dart';
import '../widgets/add_items.dart';
import '../widgets/prices_items.dart';

class BottomButton extends StatefulWidget {
  BottomButton({
    required this.text,
    required this.icon,
    required this.currency,
  });

  String text;
  IconData icon;
  var currency;

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
          future: getItemsFromAPI(),
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

  Future getItemsFromAPI() async {
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

  //get items from API
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: Theme.of(context).textTheme.headline1),
          backgroundColor: Colors.green),
    );
  }
}
