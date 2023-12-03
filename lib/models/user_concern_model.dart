// ignore_for_file: constant_identifier_names

enum Urgency {
  High,
  Low,
}

class UserConcerns {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final Urgency urgency;

  const UserConcerns({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.urgency,
  });
}
