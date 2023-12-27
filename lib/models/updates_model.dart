class Updates {
  final String author;
  final DateTime dateTime;
  final String title;
  final String description;
  final List<String>? imageURLs;

  Updates({
    required this.dateTime,
    required this.title,
    required this.description,
    required this.author,
    required this.imageURLs,
  });
}
