import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mvp_assessement/core/app/app_module.dart';

import 'core/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ModularApp(module: AppModule(), child: AppWidget()),
  );
}
