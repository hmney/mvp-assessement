import 'package:flutter/material.dart';

class AuthPageTitleWidget extends StatelessWidget {
  const AuthPageTitleWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: _themeData.textTheme.headline5?.copyWith(
          color: _themeData.accentColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
