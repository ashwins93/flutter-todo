import 'package:flutter/material.dart';
import 'package:todo_list/models/task_category.dart';

class CategoryChooser extends StatefulWidget {
  const CategoryChooser(
      {Key? key, required this.categoryList, required this.initValue})
      : super(key: key);

  final List<TaskCategory> categoryList;
  final TaskCategory initValue;

  @override
  _CategoryChooserState createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  late TaskCategory _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    var list = widget.categoryList
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
        .toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(50)),
      child: DropdownButton<TaskCategory>(
        value: _currentValue,
        onChanged: (TaskCategory? value) {
          setState(() {
            _currentValue = value!;
          });
        },
        icon: Icon(Icons.expand_more),
        iconSize: 24,
        underline: Container(),
        elevation: 1,
        items: list,
      ),
    );
  }
}
