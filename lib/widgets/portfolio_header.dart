import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/portfolio_controller.dart';

class PortfolioHeader extends StatelessWidget {
  final ValueChanged<int> onNavSelected;

  const PortfolioHeader({
    super.key,
    required this.onNavSelected,
  });

  static const List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller =
    Get.find<PortfolioController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 760;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 36,
            vertical: 14,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFFFE1CC),
              ),
            ),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'LEANUR',
                        style: TextStyle(
                          color: Color(0xFF171717),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: '.DEV',
                        style: TextStyle(
                          color: Color(0xFFFF6B00),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!isMobile)
                Obx(
                      () => Row(
                    children: List.generate(
                      navItems.length,
                          (index) => _NavButton(
                        title: navItems[index],
                        selected:
                        controller.selectedNavIndex.value == index,
                        onPressed: () => onNavSelected(index),
                      ),
                    ),
                  ),
                )
              else
                PopupMenuButton<int>(
                  tooltip: 'Open navigation',
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Color(0xFFFF6B00),
                    size: 28,
                  ),
                  onSelected: onNavSelected,
                  itemBuilder: (context) {
                    return List.generate(
                      navItems.length,
                          (index) => PopupMenuItem<int>(
                        value: index,
                        child: Text(navItems[index]),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onPressed;

  const _NavButton({
    required this.title,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: selected
            ? const Color(0xFFFF6B00)
            : const Color(0xFF333333),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
    );
  }
}