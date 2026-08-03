import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/portfolio_controller.dart';
import '../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final int index;
  final double width;
  final ProjectModel project;

  const ProjectCard({
    super.key,
    required this.index,
    required this.width,
    required this.project,
  });

  Future<void> _openUrl(String url) async {
    if (url.isEmpty) return;

    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
    )) {
      Get.snackbar(
        'Unable to open link',
        'Please verify the project URL.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final PortfolioController controller =
    Get.find<PortfolioController>();

    return Obx(() {
      final bool active =
          controller.activeProjectIndex.value == index;

      return GestureDetector(
        onTap: () => controller.toggleProject(index),
        child: AnimatedContainer(
          // ANIMATION COMPONENT 4:
          // Project card size and color transition.
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInOut,
          width: width,
          height: active ? 500 : 455,
          decoration: BoxDecoration(
            color: active
                ? const Color(0xFFFFF0E5)
                : Colors.white,
            borderRadius: BorderRadius.circular(
              active ? 28 : 20,
            ),
            border: Border.all(
              color: const Color(0xFFFF6B00),
              width: active ? 2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x15000000),
                blurRadius: 24,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 450),
                height: active ? 205 : 180,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF222222),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(19),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(19),
                  ),
                  child: Image.asset(
                    project.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF222222),
                        alignment: Alignment.center,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add_photo_alternate_outlined,
                              color: Color(0xFFFF8A35),
                              size: 52,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'ADD PROJECT IMAGE',
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171717),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              project.category.toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFFFF8A35),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            project.year,
                            style: const TextStyle(
                              color: Color(0xFFFF6B00),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        project.title.toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF171717),
                          fontSize: 18,
                          height: 1.2,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        project.description,
                        maxLines: active ? 4 : 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 7,
                        runSpacing: 7,
                        children: project.technologies
                            .map(
                              (technology) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFFFD5B5),
                              ),
                            ),
                            child: Text(
                              technology,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      const Spacer(),
                      const Divider(color: Color(0xFFFFD8BD)),
                      Row(
                        children: [
                          TextButton(
                            onPressed: project.liveUrl.isEmpty
                                ? null
                                : () => _openUrl(project.liveUrl),
                            child: const Text('VIEW PROJECT'),
                          ),
                          const Spacer(),
                          IconButton(
                            tooltip: 'GitHub',
                            onPressed: project.githubUrl.isEmpty
                                ? null
                                : () => _openUrl(project.githubUrl),
                            icon: const Icon(Icons.code_rounded),
                          ),
                          IconButton(
                            tooltip: 'Live preview',
                            onPressed: project.liveUrl.isEmpty
                                ? null
                                : () => _openUrl(project.liveUrl),
                            icon: const Icon(Icons.open_in_new_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}