import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/pages/auth_page.dart';
import 'package:mvp_assessement/core/auth/pages/email_sent_page.dart';
import 'package:mvp_assessement/core/auth/pages/forgot_password_page.dart';
import 'package:mvp_assessement/core/auth/pages/signin_page.dart';
import 'package:mvp_assessement/core/auth/pages/signup_page.dart';
import 'package:mvp_assessement/core/auth/repositories/auth_repository.dart';

import 'controllers/auth_controller.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthController()),
    Bind.singleton((i) => AuthRepository()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AUTH_PAGE,
      child: (context, args) => AuthPage(),
    ),
    ChildRoute(
      SIGNIN_PAGE,
      child: (context, args) => SigninPage(),
    ),
    ChildRoute(
      SIGNUP_PAGE,
      child: (context, args) => SignupPage(),
    ),
    ChildRoute(
      FORGOT_PASSWORD_PAGE,
      child: (context, args) => ForgotPasswordPage(),
    ),
    ChildRoute(
      EMAIL_SENT_PAGE,
      child: (context, args) => EmailSentPage(),
    ),
  ];

  static const AUTH_PAGE = '/auth';
  static Future toAuthPage() => Modular.to.pushReplacementNamed(AUTH_PAGE);
  static const SIGNUP_PAGE = '/signup';
  static Future toSignupPage() => Modular.to.pushNamed(SIGNUP_PAGE);

  static const SIGNIN_PAGE = '/signin';
  static Future toSigninPage() => Modular.to.pushNamed(SIGNIN_PAGE);

  static const FORGOT_PASSWORD_PAGE = '/forgot_password';
  static Future toForgotPasswordPage() =>
      Modular.to.pushNamed(FORGOT_PASSWORD_PAGE);

  static const EMAIL_SENT_PAGE = '/email_sent';
  static Future toEmailSentPage() =>
      Modular.to.pushReplacementNamed(EMAIL_SENT_PAGE);
}
