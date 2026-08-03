import 'package:flutter/material.dart';

import '../models/project_model.dart';
import 'project_card.dart';
import 'section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'SmartShop_BD',
      category: 'Full Stack',
      year: '2026',
      description:
      'An AI-powered interior recommendation platform that helps '
          'users choose suitable products based on room type, style '
          'and budget.',
      technologies: [
        'React',
        'Firebase',
        'Gemini AI',
        'Node.js',
      ],
      imagePath: 'assets/images/project_1.jpg',
      liveUrl: 'https://smartshop-bd.netlify.app/',
      githubUrl: 'https://github.com/Leanurrahman/SmartShop_BD',
    ),
    ProjectModel(
      title: 'MoodMate AI',
      category: 'Full Stack',
      year: '2026',
      description:
      'An intelligent mood journal that analyses user entries and '
          'provides supportive feedback, mood tracking and wellness '
          'suggestions.',
      technologies: [
        'React',
        'Firestore',
        'AI',
        'Express',
      ],
      imagePath: 'assets/images/project_2.jpg',
    ),
    ProjectModel(
      title: 'Developer Portfolio CMS',
      category: 'Frontend / CMS',
      year: '2026',
      description:
      'A dynamic multi-experience developer portfolio featuring '
          'an admin dashboard, real-time chat and content management.',
      technologies: [
        'React',
        'Firebase',
        'Motion',
        'CMS',
      ],
      imagePath: 'assets/images/project_3.jpg',
      liveUrl: 'https://leandev.netlify.app/',
    ),
    ProjectModel(
      title: 'Jute Leaf Classification',
      category: 'Machine Learning',
      year: '2026',
      description:
      'A machine-learning project for identifying different jute '
          'leaf conditions using labelled image datasets.',
      technologies: [
        'Python',
        'CNN',
        'Image Data',
        'AI',
      ],
      imagePath: 'assets/images/project_4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          label: 'Works & Case Studies',
          title: 'Selected Projects',
          description:
          'Tap a project card to expand it. Replace the placeholder '
              'images with your real project screenshots.',
        ),
        const SizedBox(height: 30),
        LayoutBuilder(
          builder: (context, constraints) {
            final int columns = constraints.maxWidth >= 1050
                ? 3
                : constraints.maxWidth >= 700
                ? 2
                : 1;

            const double spacing = 20;
            final double cardWidth =
                (constraints.maxWidth - ((columns - 1) * spacing)) /
                    columns;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(
                projects.length,
                    (index) => ProjectCard(
                  index: index,
                  width: cardWidth,
                  project: projects[index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}