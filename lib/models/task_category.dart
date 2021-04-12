import 'package:flutter/material.dart';

class TaskCategory {
  final String categoryName;
  final Color categoryColor;

  const TaskCategory(this.categoryName, this.categoryColor);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskCategory && this.categoryName == other.categoryName);

  @override
  int get hashCode => this.categoryName.hashCode ^ this.categoryColor.hashCode;
}
