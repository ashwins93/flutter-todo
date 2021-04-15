import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_category.dart';

class AddTaskAction {
  final Task task;

  AddTaskAction(this.task);
}

class RemoveTaskAction {
  final String taskId;

  RemoveTaskAction(this.taskId);
}

class UpdateTaskAction {
  final String taskId;
  final Task updatedTask;

  UpdateTaskAction(this.taskId, {required this.updatedTask});
}

class AddCategoryAction {
  final TaskCategory category;

  AddCategoryAction(this.category);
}

class RemoveCategoryAction {
  final String categoryName;

  RemoveCategoryAction(this.categoryName);
}

class UpdateCategoryAction {
  final String categoryName;
  final TaskCategory updatedCategory;

  UpdateCategoryAction(this.categoryName, {required this.updatedCategory});
}
