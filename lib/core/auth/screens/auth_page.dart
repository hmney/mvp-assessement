import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Hello world'),
    );
  }
}
