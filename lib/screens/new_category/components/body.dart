import 'dart:developer';

import 'package:flutter/material.dart';

import 'color_chooser.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 30, right: 30),
          child: TextField(
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
                hintText: 'Enter new category name',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none),
            cursorColor: Colors.blue[300],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: ColorChooser(),
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
                    elevation: MaterialStateProperty.all(10.0),
                    shadowColor: MaterialStateProperty.all(
                        Colors.black.withOpacity(0.4)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600]),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(children: [
                  Text(
                    'New category ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.expand_less)
                ]),
              ),
            ],
          ),
        )
      ],
    );
  }
}
