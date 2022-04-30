import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final void Function(String)? onChanged;
  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
    );
  }
}
