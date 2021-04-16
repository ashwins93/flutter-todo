import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/models/task_category.dart';
import 'package:todo_list/reducers/app_state_reducer.dart';
import 'package:todo_list/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final Store<AppState> store = Store<AppState>(appStateReducer,
      initialState: AppState(categories: {
        'Business': TaskCategory('Business', Colors.pink[200]!),
        'Personal': TaskCategory('Personal', Colors.blue[600]!)
      }, tasks: {
        'task1': Task(
            title: 'Daily meeting with team',
            categoryName: 'Business',
            id: 'task1'),
        'task2':
            Task(title: 'Check emails', categoryName: 'Personal', id: 'task2'),
      }));

  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(
            primaryColor: Colors.blue[600],
            scaffoldBackgroundColor: Colors.grey[50],
            textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
        home: MyHomePage(),
      ),
    );
  }
}
