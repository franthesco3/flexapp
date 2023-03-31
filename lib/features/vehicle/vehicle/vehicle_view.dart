import 'package:flutter/material.dart';
import 'package:flexapp/support/utils/localize.dart';
import '../../../support/components/card_option.dart';
import 'package:flexapp/support/components/app_bar.dart';

import '../components/button_widget.dart';

abstract class VehicleViewModelProtocol extends ChangeNotifier {
  String get year;
  String get model;
  String get consumption;

  void didTap();
  void addVehicle();
  void onChangedYaer(String year);
  void onChangedModel(String model);
  void onChangedConsumption(String consumption);
}

class VehicleView extends StatelessWidget {
  final VehicleViewModelProtocol viewModel;

  const VehicleView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarWidget(),
          const SizedBox(height: 80),
          Center(
            child: ButtonWidget(
              title: l10n.addNewVehicleTitle,
              onTap: viewModel.didTap,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CardOption(
                fuel: 'Gasolina',
                value: '5,50',
                title: 'Estrada',
                isExpanded: false,
                subtitle: 'Gasolina',
              ),
              CardOption(
                fuel: 'Etanol',
                value: '5,50',
                title: 'Ciddade',
                isExpanded: false,
                subtitle: 'Etanol',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
