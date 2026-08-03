class ProjectModel {
  final String title;
  final String category;
  final String year;
  final String description;
  final List<String> technologies;
  final String imagePath;
  final String liveUrl;
  final String githubUrl;

  const ProjectModel({
    required this.title,
    required this.category,
    required this.year,
    required this.description,
    required this.technologies,
    required this.imagePath,
    this.liveUrl = '',
    this.githubUrl = '',
  });
}