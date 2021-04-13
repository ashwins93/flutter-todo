import 'package:flutter/material.dart';
import 'package:todo_list/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
          primaryColor: Colors.blue[600],
          scaffoldBackgroundColor: Colors.grey[50],
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      home: MyHomePage(),
    );
  }
}
