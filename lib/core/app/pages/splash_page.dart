import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 360,
                height: 105,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator.adaptive(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
