import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  final String label;
  final bool isActive;

  const CategoryTab({
    super.key,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isActive ? Colors.grey.shade100 : Colors.grey[300],
        labelStyle: TextStyle(
          color: isActive ? Colors.black : Colors.black38,
        ),
      ),
    );
  }
}
