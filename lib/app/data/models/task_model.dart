class Task {
  String title;
  bool isCompleted;
  bool isImportant;

  Task(
      {required this.title,
      this.isCompleted = false,
      this.isImportant = false});
}
