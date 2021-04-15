import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/reducers/categories_reducer.dart';
import 'package:todo_list/reducers/tasks_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
      tasks: tasksReducer(state.tasks, action),
      categories: categoriesReducer(state.categories, action));
}
