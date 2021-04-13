import 'package:flutter/material.dart';
import 'package:todo_list/screens/new_task/new_task_screen.dart';

import 'components/body.dart';

class NewCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CloseIconButton(),
      ),
      body: Body(),
    );
  }
}
