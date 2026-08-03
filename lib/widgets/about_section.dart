import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/portfolio_controller.dart';
import 'section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller =
    Get.find<PortfolioController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Biography',
          title: 'About Me',
          description:
          'A short overview of my background, development focus '
              'and academic journey.',
        ),
        const SizedBox(height: 30),
        LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 850;

            final Widget profileCard = Obx(() {
              final bool expanded = controller.aboutExpanded.value;

              return GestureDetector(
                onTap: controller.toggleAbout,
                child: AnimatedContainer(
                  // ANIMATION COMPONENT 2:
                  // Profile card size and color transition.
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  constraints: BoxConstraints(
                    minHeight: expanded ? 445 : 390,
                  ),
                  padding: EdgeInsets.all(expanded ? 30 : 24),
                  decoration: BoxDecoration(
                    color: expanded
                        ? const Color(0xFFFF6B00)
                        : const Color(0xFF171717),
                    borderRadius: BorderRadius.circular(
                      expanded ? 34 : 24,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 24,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: expanded ? 100 : 76,
                        height: expanded ? 100 : 76,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.jpg',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const ColoredBox(
                                color: Color(0xFF303030),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'LEANUR RAHMAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'FULL STACK DEVELOPER',
                        style: TextStyle(
                          color: expanded
                              ? Colors.white
                              : const Color(0xFFFF8A35),
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          _StatBox(value: '4+', label: 'PROJECTS'),
                          _StatBox(value: '10+', label: 'SKILLS'),
                          _StatBox(value: 'CSE', label: 'STUDENT'),
                          _StatBox(value: 'OPEN', label: 'STATUS'),
                        ],
                      ),
                      const SizedBox(height: 22),
                      const Divider(color: Colors.white24),
                      const SizedBox(height: 12),
                      const _ProfileLine(
                        icon: Icons.location_on_outlined,
                        text: 'Chattogram, Bangladesh',
                      ),
                      const SizedBox(height: 10),
                      const _ProfileLine(
                        icon: Icons.email_outlined,
                        text: 'techbulletcodeyt@gmail.com',
                      ),
                      if (expanded) ...[
                        const SizedBox(height: 18),
                        const Text(
                          'Tap again to return to the normal card size.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            });

            const Widget biography = _BiographyCard();

            if (isMobile) {
              return Column(
                children: [
                  profileCard,
                  const SizedBox(height: 24),
                  biography,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: profileCard),
                const SizedBox(width: 26),
                const Expanded(flex: 6, child: biography),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _BiographyCard extends StatelessWidget {
  const _BiographyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFFFD8BD),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BUILDING CLEAN, RESPONSIVE AND SCALABLE '
                'DIGITAL EXPERIENCES.',
            style: TextStyle(
              color: Color(0xFF171717),
              fontSize: 26,
              height: 1.25,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Hi, I’m Leanur Rahman, a passionate CSE student at '
                'International Islamic University Chittagong and a '
                'Full Stack Developer focused on building clean, '
                'responsive and scalable applications. I enjoy solving '
                'real-world problems through code and creating digital '
                'products that are user-friendly and business-focused.',
            style: TextStyle(
              color: Color(0xFF616161),
              fontSize: 16,
              height: 1.7,
            ),
          ),
          SizedBox(height: 28),
          Divider(color: Color(0xFFFFD8BD)),
          SizedBox(height: 22),
          Row(
            children: [
              Icon(
                Icons.school_outlined,
                color: Color(0xFFFF6B00),
              ),
              SizedBox(width: 10),
              Text(
                'EDUCATION',
                style: TextStyle(
                  color: Color(0xFFFF6B00),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          Text(
            'B.Sc. in Computer Science & Engineering',
            style: TextStyle(
              color: Color(0xFF171717),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'International Islamic University Chittagong (IIUC)',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 15,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Expected graduation: 2027',
            style: TextStyle(
              color: Color(0xFF888888),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String value;
  final String label;

  const _StatBox({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ProfileLine({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}