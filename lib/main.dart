import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_application/Model/currency.dart';
import 'package:http/http.dart' as http;
import 'package:test_application/widgets/add_items.dart';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:test_application/widgets/app_bar.dart';
import 'package:test_application/widgets/bottom_widget.dart';
import 'package:test_application/widgets/main_title.dart';
import 'package:test_application/widgets/my_body.dart';
import 'package:test_application/widgets/my_list_view_separated.dart';
import 'package:test_application/widgets/prices_items.dart';
import 'package:test_application/widgets/titles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
          headline4: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.green,
          ),
          headline2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Persian
      ],
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Currency> currency = [];

  @override
  Widget build(BuildContext context) {
    getItemsFromAPIOld();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: MyAppBar(titleText: 'قیمت بروز ارز و سکه',),
      body: MyBody(currency: currency),
    );
  }

  Future getItemsFromAPIOld() async {
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
