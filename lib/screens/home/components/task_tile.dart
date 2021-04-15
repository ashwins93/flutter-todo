import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.title,
    required this.taskColor,
    this.completed = false,
  }) : super(key: key);

  final String title;
  final Color taskColor;
  final bool completed;

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
        onTap: () {},
        leading: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: completed ? Colors.grey : taskColor,
              ),
              shape: BoxShape.circle,
              color: completed ? Colors.grey : Colors.transparent),
          child: Center(
              child: completed
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )
                  : null),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: completed ? Colors.grey : Colors.grey[900],
              decoration: completed ? TextDecoration.lineThrough : null),
        ),
      ),
    );
  }
}
