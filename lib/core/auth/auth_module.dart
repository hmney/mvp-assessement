import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/pages/auth_page.dart';
import 'package:mvp_assessement/core/auth/pages/signin_page.dart';
import 'package:mvp_assessement/core/auth/pages/signup_page.dart';
import 'package:mvp_assessement/core/auth/repositories/auth_repository.dart';

import 'controllers/auth_controller.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => AuthController()),
    Bind.factory((i) => AuthRepository()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => AuthPage(),
    ),
    ChildRoute(
      SIGNIN_PAGE,
      child: (context, args) => SigninPage(),
    ),
    ChildRoute(
      SIGNUP_PAGE,
      child: (context, args) => SignupPage(),
    )
  ];

  static const SIGNUP_PAGE = '/signup';
  static Future toSignupPage() => Modular.to.pushNamed(SIGNUP_PAGE);

  static const SIGNIN_PAGE = '/signin';
  static Future toSigninPage() => Modular.to.pushNamed(SIGNIN_PAGE);
}
