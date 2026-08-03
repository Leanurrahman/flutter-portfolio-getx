import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/portfolio_controller.dart';
import 'section_header.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<_SkillData> skills = [
    _SkillData('Flutter', Icons.flutter_dash),
    _SkillData('Dart', Icons.code_rounded),
    _SkillData('GetX', Icons.bolt_rounded),
    _SkillData('Firebase', Icons.local_fire_department_outlined),
    _SkillData('React', Icons.web_rounded),
    _SkillData('Next.js', Icons.language_rounded),
    _SkillData('Node.js', Icons.hub_outlined),
    _SkillData('Express.js', Icons.route_outlined),
    _SkillData('MongoDB', Icons.storage_rounded),
    _SkillData('MySQL', Icons.table_chart_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller =
    Get.find<PortfolioController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Technical Skills',
          title: 'Tools I Work With',
          description:
          'Tap any skill card to view its size and color '
              'transition animation.',
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final int columns = constraints.maxWidth >= 1000
                ? 5
                : constraints.maxWidth >= 650
                ? 3
                : 2;

            const double spacing = 14;
            final double cardWidth =
                (constraints.maxWidth - ((columns - 1) * spacing)) /
                    columns;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(skills.length, (index) {
                return Obx(() {
                  final bool active =
                      controller.activeSkillIndex.value == index;

                  return GestureDetector(
                    onTap: () => controller.toggleSkill(index),
                    child: AnimatedContainer(
                      // ANIMATION COMPONENT 3:
                      // Skill size and color transition.
                      duration: const Duration(milliseconds: 380),
                      curve: Curves.easeInOut,
                      width: cardWidth,
                      height: active ? 118 : 94,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: active
                            ? const Color(0xFFFF6B00)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          active ? 24 : 17,
                        ),
                        border: Border.all(
                          color: const Color(0xFFFF6B00),
                          width: active ? 2 : 1,
                        ),
                        boxShadow: active
                            ? const [
                          BoxShadow(
                            color: Color(0x33FF6B00),
                            blurRadius: 22,
                            offset: Offset(0, 10),
                          ),
                        ]
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            skills[index].icon,
                            color: active
                                ? Colors.white
                                : const Color(0xFFFF6B00),
                            size: active ? 34 : 28,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            skills[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: active
                                  ? Colors.white
                                  : const Color(0xFF222222),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              }),
            );
          },
        ),
      ],
    );
  }
}

class _SkillData {
  final String name;
  final IconData icon;

  const _SkillData(this.name, this.icon);
}