import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 15.0, right: 15.0),
        child: Row(
          children: [
            CategoryCard(
              categoryColor: Colors.purpleAccent[200],
              totalTasks: 40,
              completedTasks: 20,
              categoryName: 'Business',
            ),
            CategoryCard(
              categoryColor: Colors.blue[600],
              totalTasks: 18,
              completedTasks: 5,
              categoryName: 'Personal',
            )
          ],
        ),
      ),
    );
  }
}
