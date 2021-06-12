import 'package:flutter/material.dart';
import 'package:mvp_assessement/widgets/search_textfield_widget.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search',
              style: _themeData.textTheme.headline4?.copyWith(
                  color: _themeData.primaryColor, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          SearchTextFieldWidget()
        ],
      ),
    );
  }
}
