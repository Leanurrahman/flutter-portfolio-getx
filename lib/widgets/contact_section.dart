import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/portfolio_controller.dart';
import 'section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static final List<_ContactData> contactItems = [
    _ContactData(
      title: 'Email',
      value: 'techbulletcodeyt@gmail.com',
      icon: Icons.email_outlined,
      uri: Uri(
        scheme: 'mailto',
        path: 'techbulletcodeyt@gmail.com',
        queryParameters: {
          'subject': 'Portfolio project inquiry',
        },
      ),
    ),
    _ContactData(
      title: 'Phone',
      value: '+880 1XXX-XXXXXX',
      icon: Icons.phone_outlined,
      uri: Uri.parse('tel:+8801XXXXXXXXX'),
    ),
    _ContactData(
      title: 'Location',
      value: 'Chattogram, Bangladesh',
      icon: Icons.location_on_outlined,
      uri: Uri.https(
        'www.google.com',
        '/maps/search/',
        {
          'api': '1',
          'query': 'Chattogram, Bangladesh',
        },
      ),
    ),
    _ContactData(
      title: 'GitHub',
      value: 'View my repositories',
      icon: Icons.code_rounded,
      uri: Uri.parse('https://github.com/Leanurrahman'),
    ),
    _ContactData(
      title: 'LinkedIn',
      value: 'Connect professionally',
      icon: Icons.business_center_outlined,
      uri: Uri.parse(
        'https://www.linkedin.com/in/leanur-rahman-139152328/',
      ),
    ),
  ];

  Future<void> _openContact(
      int index,
      Uri uri,
      PortfolioController controller,
      ) async {
    await controller.pulseContact(index);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    )) {
      Get.snackbar(
        'Unable to open',
        'Please check the contact link.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller =
    Get.find<PortfolioController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Contact',
          title: 'Let’s Build Something Together',
          description:
          'Use any of the interactive contact options below to '
              'reach me for freelance work, internships or collaboration.',
        ),
        const SizedBox(height: 28),
        LayoutBuilder(
          builder: (context, constraints) {
            final int columns = constraints.maxWidth >= 900
                ? 3
                : constraints.maxWidth >= 600
                ? 2
                : 1;

            const double spacing = 16;
            final double cardWidth =
                (constraints.maxWidth - ((columns - 1) * spacing)) /
                    columns;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(contactItems.length, (index) {
                return Obx(() {
                  final bool active =
                      controller.activeContactIndex.value == index;
                  final _ContactData item = contactItems[index];

                  return GestureDetector(
                    onTap: () => _openContact(
                      index,
                      item.uri,
                      controller,
                    ),
                    child: AnimatedContainer(
                      // Additional size and color transition animation.
                      duration: const Duration(milliseconds: 250),
                      width: cardWidth,
                      height: active ? 112 : 96,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: active
                            ? const Color(0xFFFF6B00)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          active ? 24 : 17,
                        ),
                        border: Border.all(
                          color: const Color(0xFFFF6B00),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: active
                                  ? Colors.white
                                  : const Color(0xFFFFF0E5),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              item.icon,
                              color: const Color(0xFFFF6B00),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: active
                                        ? Colors.white
                                        : const Color(0xFF171717),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  item.value,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: active
                                        ? Colors.white70
                                        : const Color(0xFF666666),
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_outward_rounded,
                            color: active
                                ? Colors.white
                                : const Color(0xFFFF6B00),
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

class _ContactData {
  final String title;
  final String value;
  final IconData icon;
  final Uri uri;

  const _ContactData({
    required this.title,
    required this.value,
    required this.icon,
    required this.uri,
  });
}