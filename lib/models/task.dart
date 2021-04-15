class Task {
  final String title;
  final bool completed;
  final String categoryName;
  final String id;

  Task(
      {required this.title,
      this.completed = false,
      required this.categoryName,
      required this.id});
}
