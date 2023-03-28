import 'package:flutter/material.dart';
import '../../../support/styles/app_colors.dart';
import '../../../support/components/app_bar.dart';
import '../../../support/utils/custom_paint.dart';
import 'package:flexapp/support/utils/localize.dart';
import '../../../support/components/card_option.dart';
import '../../../support/components/tag_descriptio.dart';
import '../../../support/components/bottom_nav_bar.dart';

abstract class MainViewModelProtocol extends ChangeNotifier {
  String get fuel;
  String get ethanol;
  bool get isLoading;
  String get gasoline;
  bool get expEthanol;
  bool get expGasoline;
  String get valueFuel;

  void onSave();
  void onStartUi();
  void setExpEthanol();
  void didTapEthanol();
  void setExpGasoline();
  void didTapGasoline();
  void changedEthanol(String fuel);
  void changedGasoline(String fuel);
}

class MainView extends StatelessWidget {
  final MainViewModelProtocol viewModel;

  const MainView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: Colors.blueAccent,
      body: CustomPaint(
        painter: MyCustomPaint(),
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (_, __) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(),
                  const SizedBox(height: 60),
                  TagDescription(
                    price: viewModel.ethanol,
                    onTap: viewModel.didTapEthanol,
                    title: l10n.ethanolTitle.toUpperCase(),
                  ),
                  const SizedBox(height: 20),
                  TagDescription(
                    price: viewModel.gasoline,
                    onTap: viewModel.didTapGasoline,
                    title: l10n.gasolineTitle.toUpperCase(),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CardOption(
                        fuel: viewModel.fuel,
                        title: l10n.cityTitle,
                        subtitle: viewModel.fuel,
                        value: viewModel.valueFuel,
                        color: AppColor.greenStrong,
                        onTap: viewModel.setExpEthanol,
                        isExpanded: viewModel.expEthanol,
                      ),
                      CardOption(
                        fuel: viewModel.fuel,
                        title: l10n.roadTitle,
                        subtitle: viewModel.fuel,
                        value: viewModel.valueFuel,
                        onTap: viewModel.setExpGasoline,
                        isExpanded: viewModel.expGasoline,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
