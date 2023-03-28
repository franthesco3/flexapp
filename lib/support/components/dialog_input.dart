import 'package:flexapp/support/utils/localize.dart';
import 'package:flutter/material.dart';

class InputFuel extends StatelessWidget {
  final String fuel;
  final Function()? onSave;
  final Function(String fuel)? onChanged;

  const InputFuel({
    super.key,
    this.onSave,
    this.onChanged,
    required this.fuel,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AlertDialog(
      title: Text(l10n.newPriceTitle),
      actions: [
        TextButton(
          onPressed: onSave,
          child: Text(l10n.saveLabel),
        ),
      ],
      content: TextField(
        maxLength: 4,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
