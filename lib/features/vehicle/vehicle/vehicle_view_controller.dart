import 'vehicle_view.dart';
import 'package:flutter/material.dart';

abstract class VehicleProtocol extends VehicleViewModelProtocol {
  void Function()? onSaveSuccess;
  void Function()? showModalBottomShett;
}

class VehicleViewController extends StatefulWidget {
  final VehicleProtocol viewModel;

  const VehicleViewController({super.key, required this.viewModel});

  @override
  State<VehicleViewController> createState() => _VehicleViewControllerState();
}

class _VehicleViewControllerState extends State<VehicleViewController> {
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VehicleView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.showModalBottomShett = () {};

    widget.viewModel.onSaveSuccess = () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Veículo salvo com sucesso!'),
        ),
      );
    };
  }
}
