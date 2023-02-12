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
          ),
          headline2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
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

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: myAppBar('قیمت بروز ارز و سکه', context),
      body: myBody(context),
    );
  }
}

myAppBar(String titleText, BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    actions: [
      Image.asset('assets/images/icon.png'),
      Align(
        alignment: Alignment.center,
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headline1,
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

myBody(BuildContext context) {
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
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
           style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    ),
  );
} //body of scaffold