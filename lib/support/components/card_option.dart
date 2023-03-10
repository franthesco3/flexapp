import '../styles/app_colors.dart';
import 'package:flutter/material.dart';

class CardOption extends StatelessWidget {
  final Color? color;
  final String title;
  final String subtitle;

  const CardOption({
    super.key,
    this.color,
    required this.title,
    required this.subtitle,
  });

  Color get colorCard {
    if (color == null) return AppColor.redDown;

    return color ?? AppColor.redDown;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorCard,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: 150,
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
          Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 31,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_drop_down, color: Colors.grey),
                Text(
                  'Detalhes',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
