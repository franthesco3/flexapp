import '../styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flexapp/support/utils/localize.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 60),
      child: RichText(
        text: TextSpan(
          text: l10n.appTitle,
          style: const TextStyle(
            fontSize: 50,
            color: AppColor.greenDown,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: l10n.app,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: AppColor.bluePurple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
