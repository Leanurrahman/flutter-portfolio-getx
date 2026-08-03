import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/portfolio_controller.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onContact,
  });

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
            horizontal: isMobile ? 22 : 48,
            vertical: isMobile ? 34 : 50,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              isMobile ? 24 : 32,
            ),
            border: Border.all(
              color: const Color(0xFFFFD5B5),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x18FF6B00),
                blurRadius: 35,
                offset: Offset(0, 16),
              ),
            ],
          ),

          // Mobile and desktop layout
          child: isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroTextContent(
                controller: controller,
                onViewProjects: onViewProjects,
                onContact: onContact,
                isMobile: true,
              ),
              const SizedBox(height: 42),
              const _HeroProfile(),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: _HeroTextContent(
                  controller: controller,
                  onViewProjects: onViewProjects,
                  onContact: onContact,
                  isMobile: false,
                ),
              ),
              const SizedBox(width: 48),
              const Expanded(
                flex: 4,
                child: _HeroProfile(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeroTextContent extends StatelessWidget {
  final PortfolioController controller;
  final VoidCallback onViewProjects;
  final VoidCallback onContact;
  final bool isMobile;

  const _HeroTextContent({
    required this.controller,
    required this.onViewProjects,
    required this.onContact,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Availability label
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF0E5),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color(0xFFFFD5B5),
            ),
          ),
          child: const Text(
            'OPEN FOR REMOTE FULL-STACK WORK',
            style: TextStyle(
              color: Color(0xFFFF6B00),
              fontSize: 10,
              letterSpacing: 1.4,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const SizedBox(height: 26),

        Text(
          'I BUILD',
          style: TextStyle(
            color: const Color(0xFF171717),
            fontSize: isMobile ? 44 : 66,
            height: 0.95,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 9),

        Text(
          'FULL-STACK WEB',
          style: TextStyle(
            color: const Color(0xFFFF6B00),
            fontSize: isMobile ? 36 : 57,
            height: 1,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          'EXPERIENCES',
          style: TextStyle(
            color: const Color(0xFF171717),
            fontSize: isMobile ? 37 : 57,
            height: 1,
            fontWeight: FontWeight.w900,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'THAT HELP BRANDS GROW',
          style: TextStyle(
            color: const Color(0xFF595959),
            fontSize: isMobile ? 21 : 32,
            height: 1.15,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 26),

        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 650,
          ),
          child: const Text(
            'I’m Leanur Rahman, a Full Stack Developer from '
                'Bangladesh. I build clean, responsive, scalable and '
                'user-focused web and mobile applications.',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 16,
              height: 1.65,
            ),
          ),
        ),
        const SizedBox(height: 30),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            // Size and color transition animation
            Obx(() {
              final bool active =
                  controller.heroButtonActive.value;

              return GestureDetector(
                onTap: () async {
                  await controller.pulseHeroButton();
                  onViewProjects();
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  curve: Curves.easeInOut,
                  width: active ? 182 : 166,
                  height: active ? 57 : 51,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: active
                        ? const Color(0xFF171717)
                        : const Color(0xFFFF6B00),
                    borderRadius: BorderRadius.circular(
                      active ? 18 : 14,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: active
                            ? const Color(0x33000000)
                            : const Color(0x3DFF6B00),
                        blurRadius: active ? 24 : 17,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Text(
                        'VIEW PROJECTS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              );
            }),

            SizedBox(
              height: 51,
              child: OutlinedButton.icon(
                onPressed: onContact,
                icon: const Icon(
                  Icons.send_rounded,
                  size: 18,
                ),
                label: const Text(
                  'CONTACT ME',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                  const Color(0xFFFF6B00),
                  side: const BorderSide(
                    color: Color(0xFFFF6B00),
                    width: 1.4,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroProfile extends StatelessWidget {
  const _HeroProfile();

  @override
  Widget build(BuildContext context) {
    final bool isMobile =
        MediaQuery.sizeOf(context).width < 760;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 360,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color(0xFF171717),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0xFFFF6B00),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3DFF6B00),
                    blurRadius: 34,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/profile.jpg',
                  width: double.infinity,
                  height: isMobile ? 350 : 405,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (
                      context,
                      error,
                      stackTrace,
                      ) {
                    return Container(
                      height: isMobile ? 350 : 405,
                      color: const Color(0xFF292929),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                            size: 90,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Add profile.jpg',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // Availability card
            Positioned(
              left: isMobile ? 12 : -18,
              bottom: 25,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFFFD5B5),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 22,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 4,
                          backgroundColor:
                          Color(0xFF00C853),
                        ),
                        SizedBox(width: 7),
                        Text(
                          'CURRENT STATUS',
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Text(
                      'AVAILABLE FOR WORK',
                      style: TextStyle(
                        color: Color(0xFFFF6B00),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Code icon
            Positioned(
              right: isMobile ? 10 : -10,
              top: 26,
              child: Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B00),
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40FF6B00),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.code_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}