import 'package:flutter/material.dart';

class NamedTextCard extends StatelessWidget {
  final String category;

  const NamedTextCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(category),
        const SizedBox(
          width: 220,
        ),
        const Text("See All")
      ],
    );
  }
}
