import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/models/task_category.dart';

final categoriesReducer = combineReducers<Map<String, TaskCategory>>([
  TypedReducer(_addCategory),
  TypedReducer(_updateCategory),
  TypedReducer(_removeCategory)
]);

Map<String, TaskCategory> _addCategory(
    Map<String, TaskCategory> tasks, AddCategoryAction action) {
  return Map<String, TaskCategory>.from(tasks)
    ..[action.category.categoryName] = action.category;
}

Map<String, TaskCategory> _updateCategory(
    Map<String, TaskCategory> tasks, UpdateCategoryAction action) {
  return Map<String, TaskCategory>.from(tasks)
    ..[action.categoryName] = action.updatedCategory;
}

Map<String, TaskCategory> _removeCategory(
    Map<String, TaskCategory> tasks, RemoveCategoryAction action) {
  return Map<String, TaskCategory>.from(tasks)
    ..removeWhere((key, value) => value.categoryName == action.categoryName);
}
