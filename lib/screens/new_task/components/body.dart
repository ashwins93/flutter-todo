import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_category.dart';
import 'package:todo_list/screens/new_category/new_category_screen.dart';
import 'package:uuid/uuid.dart';

import 'category_chooser.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TaskCategory _currentValue = TaskCategory.empty();

  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

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
              controller: _myController,
              style: TextStyle(fontSize: 24),
              decoration: InputDecoration(
                  hintText: 'Create new task',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none),
              cursorColor: Colors.blue[300],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                StoreConnector<AppState, List<TaskCategory>>(
                  converter: (store) {
                    return store.state.categories.values.toList();
                  },
                  builder: (context, categoryList) => CategoryChooser(
                    categoryList: categoryList,
                    currentValue: _currentValue,
                    onCategoryChange: (TaskCategory? newValue) {
                      setState(() {
                        _currentValue = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: IconButton(
                      icon: Icon(Icons.create),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewCategoryScreen()));
                      }),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30.0),
            child: Row(
              children: [
                Spacer(),
                StoreConnector<AppState, void Function(String, String)>(
                  converter: (store) {
                    return (taskTitle, categoryName) {
                      store.dispatch(AddTaskAction(Task(
                          title: taskTitle,
                          categoryName: categoryName,
                          id: Uuid().v4())));
                    };
                  },
                  builder: (context, onClick) => ElevatedButton(
                    style: ButtonStyle(
                        alignment: Alignment.centerRight,
                        elevation: MaterialStateProperty.all(10.0),
                        shadowColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.4)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[600]),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))))),
                    onPressed: () {
                      if (_currentValue == TaskCategory.empty()) return;
                      onClick(_myController.text, _currentValue.categoryName);
                      Navigator.pop(context);
                    },
                    child: Row(children: [
                      Text(
                        'New task ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.expand_less)
                    ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
