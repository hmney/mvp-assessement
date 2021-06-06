import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({Key? key, this.flex, required this.minHeight})
      : super(key: key);

  final int? flex;
  final double minHeight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
      ),
    );
  }
}
