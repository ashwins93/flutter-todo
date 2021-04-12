import 'package:flutter/material.dart';
import 'package:todo_list/models/task_category.dart';

import 'components/body.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryList = <TaskCategory>[
      TaskCategory('Business', Colors.purpleAccent[200]!),
      TaskCategory('Personal', Colors.blue[600]!)
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: CloseIconButton(),
      ),
      body: Body(categoryList: categoryList),
    );
  }
}

class CloseIconButton extends StatelessWidget {
  const CloseIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.grey[300]!),
            shape: BoxShape.circle),
        alignment: Alignment.center,
        child: IconButton(
            color: Colors.grey[600],
            icon: Icon(
              Icons.close,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
