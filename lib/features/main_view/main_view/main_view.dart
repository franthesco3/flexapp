import 'package:flexapp/support/utils/localize.dart';
import 'package:flutter/material.dart';
import '../../../support/components/app_bar.dart';
import '../../../support/components/card_option.dart';
import '../../../support/styles/app_colors.dart';
import '../../../support/components/bottom_nav_bar.dart';
import '../../../support/components/tag_descriptio.dart';
import '../../../support/utils/custom_paint.dart';

abstract class MainViewModelProtocol extends ChangeNotifier {
  void onStartUi();
  bool get isLoading;
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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(),
                  const SizedBox(height: 40),
                  TagDescription(
                    title: l10n.ethanolTitle.toUpperCase(),
                    price: '3,80',
                  ),
                  const SizedBox(height: 20),
                  TagDescription(
                    title: l10n.gasolineTitle.toUpperCase(),
                    price: '3,80',
                  ),
                  const SizedBox(height: 20),
                  TagDescription(
                    title: l10n.average,
                    price: '3,80',
                  ),
                  const SizedBox(height: 60),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CardOption(
                          title: 'Cidade',
                          subtitle: 'Etanol',
                          color: AppColor.greenStrong,
                        ),
                        CardOption(title: 'Estrada', subtitle: 'Gasolina'),
                        CardOption(title: 'Estrada', subtitle: 'Gasolina'),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
