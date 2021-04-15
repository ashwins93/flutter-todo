import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_category.dart';

class AppState {
  final Map<String, Task> tasks;
  final Map<String, TaskCategory> categories;

  AppState({required this.tasks, required this.categories});
}
