import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.width,
    required this.height,
    this.alignment,
  }) : super(key: key);

  final double width;
  final double height;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Image(
        width: width,
        height: height,
        image: AssetImage('assets/images/logo.png'),
      ),
    );
  }
}
