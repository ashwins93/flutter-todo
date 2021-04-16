import 'package:flutter/material.dart';
import 'package:todo_list/models/task_category.dart';

class CategoryChooser extends StatelessWidget {
  CategoryChooser({
    Key? key,
    required this.categoryList,
    required this.currentValue,
    required this.onCategoryChange,
  }) : super(key: key);

  final List<TaskCategory> categoryList;
  final void Function(TaskCategory?) onCategoryChange;
  final TaskCategory currentValue;

  @override
  Widget build(BuildContext context) {
    print(currentValue);
    var list = categoryList
        .map<DropdownMenuItem<TaskCategory>>((taskCategory) => DropdownMenuItem(
              value: taskCategory,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(taskCategory.categoryName),
                  ),
                  Icon(
                    Icons.palette,
                    color: taskCategory.categoryColor,
                  )
                ],
              ),
            ))
        .toList()
          ..add(DropdownMenuItem(
              value: TaskCategory.empty(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('Choose Category'),
                  ),
                  Icon(Icons.palette, color: Colors.grey)
                ],
              )));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                blurRadius: 8,
                color: Colors.black.withOpacity(0.05))
          ],
          borderRadius: BorderRadius.circular(50)),
      child: DropdownButton<TaskCategory>(
        value: currentValue,
        onChanged: onCategoryChange,
        icon: Icon(Icons.expand_more),
        iconSize: 24,
        underline: Container(),
        elevation: 1,
        items: list,
      ),
    );
  }
}
