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
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
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
        ),
        SizedBox(height: 25),
        Container(
          height: 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            color: Color.fromARGB(255, 130, 130, 130),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'نام آزاد ارز',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'قیمت',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'تغییر',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: 11,
            itemBuilder: (BuildContext context, int pos) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: PricesItems(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index % 9 == 0) {
                return AddItems();
              } //
              else {
                return SizedBox(width: 0);
              }
            },
          ),
        ),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000)),
                      ),
                    ),
                    onPressed: () =>
                        _showSnackBar(context, 'بروز رسانی با موفقیت انجام شد'),
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
  );
}

class PricesItems extends StatelessWidget {
  const PricesItems({
    Key? key,
  }) : super(key: key);

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
            'دلار',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '46000',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '5+',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

class AddItems extends StatelessWidget {
  const AddItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.red,
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
            'تبلیغات',
            style: TextStyle(color: Colors.white),
          ),
        ],
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
  return 'hello';
}
