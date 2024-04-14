import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({required this.titleText});

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
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
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
