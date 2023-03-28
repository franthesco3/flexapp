import 'package:flutter/material.dart';
import 'package:flexapp/support/components/dialog_input.dart';
import 'package:flexapp/features/main_view/main_view/main_view.dart';

enum Fuel { ethanol, gasoline }

abstract class MainViewProtocol extends MainViewModelProtocol {
  void Function(Fuel fuel)? onTapFuel;
}

class MainViewController extends StatefulWidget {
  final MainViewProtocol viewModel;

  const MainViewController({super.key, required this.viewModel});

  @override
  State<MainViewController> createState() => _MainViewControllerState();
}

class _MainViewControllerState extends State<MainViewController> {
  @override
  void initState() {
    _bind();
    widget.viewModel.onStartUi();
    widget.viewModel.onSave();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapFuel = (fuel) {
      showDialog(
        context: context,
        builder: (_) {
          return InputFuel(
            fuel: widget.viewModel.ethanol,
            onSave: () {
              widget.viewModel.onSave();
              Navigator.pop(context);
            },
            onChanged: (value) => chooiseFuel(fuel, value),
          );
        },
      );
    };
  }

  void chooiseFuel(Fuel fuel, String value) {
    switch (fuel) {
      case Fuel.ethanol:
        widget.viewModel.changedEthanol(value);
        break;
      case Fuel.gasoline:
        widget.viewModel.changedGasoline(value);
        break;
    }
  }
}
