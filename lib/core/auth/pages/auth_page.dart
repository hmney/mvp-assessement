import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';
import 'package:mvp_assessement/core/auth/pages/signin_page.dart';
import 'package:mvp_assessement/modules/home/pages/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: controller.authStateChangesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            return SigninPage();
          } else {
            return HomePage();
          }
        }
        return SizedBox();
      },
    );
  }
}
