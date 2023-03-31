import '../styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/localize.dart';

class CardOption extends StatelessWidget {
  final String fuel;
  final Color? color;
  final String title;
  final String value;
  final bool isExpanded;
  final String subtitle;
  final Function()? onTap;

  const CardOption({
    super.key,
    this.color,
    this.onTap,
    required this.fuel,
    required this.value,
    required this.title,
    required this.subtitle,
    required this.isExpanded,
  });

  Color get colorCard {
    if (color == null) return AppColors.redDown;

    return color ?? AppColors.redDown;
  }

  double get expandedContainer {
    if (isExpanded) return 320;

    return 160;
  }

  Widget? get content {
    if (isExpanded) {
      return RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: 'Você pagará '),
            TextSpan(
              text: 'R\$ $value ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'com $fuel',
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Icon get iconPosition {
    if (isExpanded) return const Icon(Icons.arrow_drop_up, color: Colors.grey);

    return const Icon(Icons.arrow_drop_down, color: Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      decoration: BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: 160,
      height: expandedContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 19, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 31,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: content),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconPosition,
                  Text(
                    l10n.details,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
