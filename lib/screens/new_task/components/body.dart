import 'package:flutter/material.dart';
import 'package:todo_list/models/task_category.dart';

import 'category_chooser.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  final List<TaskCategory> categoryList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
            child: TextField(
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  hintText: 'Create new task',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none),
              cursorColor: Colors.blue[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: CategoryChooser(
                categoryList: categoryList, initValue: categoryList[0]),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
            child: Row(
              children: [
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                      alignment: Alignment.centerRight,
                      elevation: MaterialStateProperty.all(8.0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[600]),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))))),
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      'New task ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.expand_less)
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
