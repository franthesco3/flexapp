import 'package:flutter/material.dart';

import '../../../support/styles/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ButtonWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 250,
        decoration: const BoxDecoration(
          color: AppColors.redDown,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
