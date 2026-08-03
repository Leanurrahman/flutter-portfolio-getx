import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/portfolio_controller.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/portfolio_header.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PortfolioController controller =
  Get.find<PortfolioController>();

  final List<GlobalKey> sectionKeys =
  List<GlobalKey>.generate(5, (_) => GlobalKey());

  void _scrollToSection(int index) {
    controller.selectNav(index);

    final BuildContext? sectionContext =
        sectionKeys[index].currentContext;

    if (sectionContext == null) return;

    Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding =
    MediaQuery.sizeOf(context).width < 600 ? 18 : 34;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      body: SafeArea(
        child: Column(
          children: [
            PortfolioHeader(
              onNavSelected: _scrollToSection,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 28,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 1200,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeroSection(
                          key: sectionKeys[0],
                          onViewProjects: () => _scrollToSection(3),
                          onContact: () => _scrollToSection(4),
                        ),
                        const SizedBox(height: 90),
                        AboutSection(key: sectionKeys[1]),
                        const SizedBox(height: 90),
                        SkillsSection(key: sectionKeys[2]),
                        const SizedBox(height: 90),
                        ProjectsSection(key: sectionKeys[3]),
                        const SizedBox(height: 90),
                        ContactSection(key: sectionKeys[4]),
                        const SizedBox(height: 60),
                        const Center(
                          child: Text(
                            '© 2026 Leanur Rahman • Flutter Portfolio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}