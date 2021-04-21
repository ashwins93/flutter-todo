import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/selectors/selectors.dart';

import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) => Column(
          children: vm.tasks.entries
              .map((entry) => TaskTile(
                    key: Key(entry.key.id),
                    taskColor: entry.value,
                    task: entry.key,
                    onDeleteAction: () {
                      print("Deleting ${entry.key.id}");
                      vm.onDelete(entry.key.id);
                    },
                    onTapAction: () {
                      vm.onComplete(
                          entry.key.id,
                          Task(
                              title: entry.key.title,
                              categoryName: entry.key.categoryName,
                              id: entry.key.id,
                              completed: !entry.key.completed));
                    },
                  ))
              .toList()),
    );
  }
}

class _ViewModel {
  final Map<Task, Color> tasks;
  final void Function(String, Task) onComplete;
  final void Function(String) onDelete;

  _ViewModel(
      {required this.onDelete, required this.tasks, required this.onComplete});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        tasks: tasksSelector(store.state),
        onComplete: (id, updatedTask) {
          store.dispatch(UpdateTaskAction(id, updatedTask: updatedTask));
        },
        onDelete: (id) {
          store.dispatch(RemoveTaskAction(id));
        });
  }
}
