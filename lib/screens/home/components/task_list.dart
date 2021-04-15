import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/selectors/selectors.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Column(
          children: vm.tasks.entries
              .map((entry) => TaskTile(
                    title: entry.key.title,
                    taskColor: entry.value,
                    completed: entry.key.completed,
                  ))
              .toList()),
    );
  }
}

class _ViewModel {
  final Map<Task, Color> tasks;

  _ViewModel(this.tasks);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(tasksSelector(store.state));
  }
}
