// ignore_for_file: constant_identifier_names

enum Urgency {
  High,
  Low,
}

enum ConcernStatus {
  Pending,
  Viewed,
}

class UserConcerns {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final Urgency urgency;
  final DateTime dateTime;
  final ConcernStatus concernStatus;

  const UserConcerns({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.urgency,
    required this.dateTime,
    required this.concernStatus,
  });
}
