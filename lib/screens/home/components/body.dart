import 'package:flutter/material.dart';

import 'category_list.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text("What's up, Joy!",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.grey[800], fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SectionTitle(
                title: 'Categories',
              ),
            ),
            CategoriesList(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, top: 12.0, bottom: 10.0),
              child: SectionTitle(
                title: 'Tasks',
              ),
            ),
            Column(
              children: [
                Task(
                  title: 'Daily meeting with team',
                  taskColor: Colors.purpleAccent[200]!,
                ),
                Task(
                  title: 'Check emails',
                  taskColor: Colors.blue[600]!,
                ),
                Task(
                  title: 'Lunch with Emma',
                  taskColor: Colors.purpleAccent[200]!,
                ),
                Task(
                  title: 'Pay rent',
                  taskColor: Colors.blue[600]!,
                  completed: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  const Task({
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
