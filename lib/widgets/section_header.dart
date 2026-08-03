import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? description;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 34,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFFFF6B00),
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF171717),
            fontSize: 34,
            height: 1.15,
            fontWeight: FontWeight.w900,
          ),
        ),
        if (description != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              description!,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),
        ],
      ],
    );
  }
}