import 'package:flutter/material.dart';
import 'package:flexapp/features/main_view/main_view_factory.dart';

class MobileRoutes {
  static const initialRoute = MainViewFactory.route;

  static Map<String, WidgetBuilder> routes = {
    MainViewFactory.route: (context) {
      return MainViewFactory.mainView();
    }
  };
}
