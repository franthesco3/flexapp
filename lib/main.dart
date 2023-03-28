import 'support/utils/localize.dart';
import 'package:flutter/material.dart';
import 'features/main_view/main_view_factory.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:flexapp/support/utils/mobile_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MobileRoutes.routes,
      initialRoute: MainViewFactory.route,
      theme: ThemeData(primarySwatch: Colors.blue),
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    );
  }
}
