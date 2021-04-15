import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/models/task.dart';

final tasksReducer = combineReducers<Map<String, Task>>([
  TypedReducer(_addTask),
  TypedReducer(_updateTask),
  TypedReducer(_removeTask)
]);

Map<String, Task> _addTask(Map<String, Task> tasks, AddTaskAction action) {
  return Map.from(tasks)..[action.task.id] = action.task;
}

Map<String, Task> _updateTask(
    Map<String, Task> tasks, UpdateTaskAction action) {
  return Map<String, Task>.from(tasks)..[action.taskId] = action.updatedTask;
}

Map<String, Task> _removeTask(
    Map<String, Task> tasks, RemoveTaskAction action) {
  return Map<String, Task>.from(tasks)
    ..removeWhere((key, value) => value.id == action.taskId);
}
