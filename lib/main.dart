import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_application/Model/currency.dart';
import 'package:http/http.dart' as http;
import 'package:test_application/widgets/add_items.dart';
import 'dart:convert' as convert;
import 'dart:developer' as developer;

import 'package:test_application/widgets/app_bar.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    getItemsFromAPIOld();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: MyAppBar(titleText: 'قیمت بروز ارز و سکه',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                Image.asset('assets/images/question_mark.png'),
                SizedBox(width: 15),
                Text(
                  'نرخ ارز آزاد چیست؟',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 25),
            Titles(title1: 'نام آزاد ارز', title2: 'قیمت', title3: 'قیمت',),
            SizedBox(height: 10),
            MyListViewSeparated(currency: currency),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 52,
                      child: TextButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 202, 193, 255),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000)),
                          ),
                        ),
                        onPressed: () => _showSnackBar(
                            context, 'بروز رسانی با موفقیت انجام شد'),
                        icon: Icon(Icons.refresh_sharp,
                            color: Colors.black, size: 27),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text('بروزر رسانی',
                              style: TextStyle(
                                fontFamily: 'dana',
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      'آخرین بروز رسانی    ${_getTime()}',
                      style: TextStyle(
                        fontFamily: 'dana',
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(message, style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.green),
  );
}

String _getTime() {
  return 'test';
}
