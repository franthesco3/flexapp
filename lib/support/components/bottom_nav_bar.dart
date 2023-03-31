import 'package:flexapp/support/utils/localize.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.blueTheme,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.startTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.directions_car),
            label: l10n.vehicleTitle,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.checklist_sharp),
            label: l10n.report,
          ),
        ],
        selectedItemColor: Colors.white,
      ),
    );
  }
}
