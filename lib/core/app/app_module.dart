import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/app/pages/splash_page.dart';
import 'package:mvp_assessement/core/auth/auth_module.dart';
import 'package:mvp_assessement/modules/projects/projects_module.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => SplashPage(),
    ),
    ModuleRoute(
      '',
      module: AuthModule(),
    ),
    ModuleRoute(
      '',
      module: ProjectsModule(),
    ),
  ];
}
