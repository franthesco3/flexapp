import 'package:flexapp/features/vehicle/vehicle_factory.dart';
import 'package:flutter/material.dart';
import 'package:flexapp/features/main_view/main_view_factory.dart';

class MobileRoutes {
  static const initialRoute = VehicleFactory.route;

  static Map<String, WidgetBuilder> routes = {
    MainViewFactory.route: (context) {
      return MainViewFactory.mainView();
    },
    VehicleFactory.route: (context) {
      return VehicleFactory.vehicle();
    }
  };
}
