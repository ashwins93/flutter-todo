import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryName,
    required this.totalTasks,
    required this.completedTasks,
    required this.categoryColor,
  }) : super(key: key);

  final String categoryName;
  final int totalTasks, completedTasks;
  final Color? categoryColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.55,
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 5),
              color: Colors.black.withOpacity(0.05)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: '$totalTasks tasks\n',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              TextSpan(
                  text: categoryName,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 22,
                      fontWeight: FontWeight.bold))
            ])),
          ),
          LinearProgressIndicator(
            value: completedTasks / totalTasks,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(categoryColor!),
            minHeight: 3.0,
          ),
        ],
      ),
    );
  }
}
