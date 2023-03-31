import 'package:flexapp/features/vehicle/vehicle/vehicle_view_controller.dart';
import 'package:flexapp/features/vehicle/vehicle/vehicle_view_model.dart';
import 'package:flutter/material.dart';

class VehicleFactory {
  static const String route = '/vehicle';

  static StatefulWidget vehicle() {
    final viewModel = VehicleViewModel();

    return VehicleViewController(
      viewModel: viewModel,
      key: ObjectKey(
        viewModel,
      ),
    );
  }
}
