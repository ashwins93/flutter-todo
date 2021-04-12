import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
      width: size.width,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
    );
  }
}
