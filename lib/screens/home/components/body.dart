import 'package:flutter/material.dart';

import 'category_list.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Text("What's up, Joy!",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.grey[800], fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SectionTitle(
                title: 'Categories',
              ),
            ),
            CategoriesList()
          ],
        ),
      ),
    );
  }
}
