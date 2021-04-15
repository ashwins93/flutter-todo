import 'package:flutter/material.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_category.dart';

class CategoryData {
  final int totalTaskCount;
  final int completedTaskCount;

  CategoryData(
      {required this.totalTaskCount, required this.completedTaskCount});
}

Map<Task, Color> tasksSelector(AppState state) {
  return state.tasks.map((key, task) =>
      MapEntry(task, state.categories[task.categoryName]!.categoryColor));
}

Map<TaskCategory, CategoryData> categoriesSelector(AppState state) {
  return state.categories.map((_, category) => MapEntry(
      category,
      CategoryData(
          completedTaskCount:
              _getCompletedTaskCount(state, category.categoryName),
          totalTaskCount: _getTotalTaskCount(state, category.categoryName))));
}

int _getTotalTaskCount(AppState state, String categoryName) {
  return state.tasks.values
      .where((task) => task.categoryName == categoryName)
      .length;
}

int _getCompletedTaskCount(AppState state, String categoryName) {
  return state.tasks.values
      .where((task) => (task.categoryName == categoryName) && task.completed)
      .length;
}
