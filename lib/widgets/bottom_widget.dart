import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
  }
}