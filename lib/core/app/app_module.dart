import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ModuleRoute('', module: AuthModule()),
  ];
}
