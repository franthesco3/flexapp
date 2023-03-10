import 'package:flexapp/features/main_view/main_view/main_view.dart';
import 'package:flutter/material.dart';

abstract class MainViewProtocol extends MainViewModelProtocol {}

class MainViewController extends StatefulWidget {
  final MainViewProtocol viewModel;

  const MainViewController({super.key, required this.viewModel});

  @override
  State<MainViewController> createState() => _MainViewControllerState();
}

class _MainViewControllerState extends State<MainViewController> {
  @override
  void initState() {
    widget.viewModel.onStartUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainView(viewModel: widget.viewModel);
  }
}
