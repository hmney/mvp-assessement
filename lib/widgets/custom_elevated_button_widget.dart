import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.width,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(label),
            Spacer(flex: 2),
            if (icon != null) Icon(icon),
          ],
        ),
      ),
    );
  }
}
