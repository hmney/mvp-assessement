import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/auth_module.dart';
import 'package:mvp_assessement/core/auth/controllers/auth_controller.dart';
import 'package:mvp_assessement/core/auth/screens/auth_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/auth', module: AuthModule()),
    ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage())
  ];
}
