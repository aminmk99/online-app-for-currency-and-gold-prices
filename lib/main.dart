import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('قیمت بروز ارز و سکه'),
      body: myBody(),
    );
  }
}

myAppBar(String titleText) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Image.asset('assets/images/icon.png'),
      Align(
        alignment: Alignment.center,
        child: Text(
          titleText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Image.asset(
              'assets/images/menu.png',
            ),
          ),
        ),
      ),
    ],
  );
} //app bar of scaffold

myBody() {
  return Padding(
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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    ),
  );
} //body of scaffold