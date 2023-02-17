import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;


import '../Model/currency.dart';
import '../widgets/app_bar.dart';
import '../widgets/my_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Currency> currency = [];

  @override
  Widget build(BuildContext context) {
    getItemsFromAPI();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: MyAppBar(
        titleText: 'قیمت بروز ارز و سکه',
      ),
      body: MyBody(currency: currency),
    );
  }
  Future getItemsFromAPI() async {
    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";

    var value = await http.get(Uri.parse(url));

    developer.log(value.statusCode.toString(), name: 'getResponse'); //get log instead of printing
    if (currency.isEmpty) {
      if (value.statusCode == 200) {
        List jsonList = convert.jsonDecode(value.body);

        if (jsonList.length != 0) {
          for (var i = 0; i < jsonList.length; i++) {
            setState(() {
              currency.add(
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
  } //get items from API
}