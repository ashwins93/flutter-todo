import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
    required this.taskColor,
    required this.onTapAction,
  }) : super(key: key);

  final Task task;
  final Color taskColor;
  final void Function() onTapAction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        onTap: onTapAction,
        leading: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: task.completed ? Colors.grey : taskColor,
              ),
              shape: BoxShape.circle,
              color: task.completed ? Colors.grey : Colors.transparent),
          child: Center(
              child: task.completed
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )
                  : null),
        ),
        title: Text(
          task.title,
          style: TextStyle(
              color: task.completed ? Colors.grey : Colors.grey[900],
              decoration: task.completed ? TextDecoration.lineThrough : null),
        ),
      ),
    );
  }
}
