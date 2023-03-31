import 'package:flexapp/features/main_view/main_view_factory.dart';
import 'package:flutter/material.dart';

import '../../../support/components/bottom_nav_bar.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [
      MainViewFactory.mainView(),
    ];
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
