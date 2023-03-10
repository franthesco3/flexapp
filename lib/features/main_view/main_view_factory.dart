import 'package:flexapp/features/main_view/main_view/main_view_model.dart';
import 'package:flutter/material.dart';

import 'main_view/main_view_controller.dart';

class MainViewFactory {
  static const String route = '/main_view';

  static StatefulWidget mainView() {
    final viewModel = MainViewModel();

    return MainViewController(viewModel: viewModel);
  }
}
