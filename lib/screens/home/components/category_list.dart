import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/task_category.dart';
import 'package:todo_list/selectors/selectors.dart';

import 'category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 20.0, left: 15.0, right: 15.0, top: 10.0),
          child: Row(
              children: vm.categories.entries
                  .map((entry) => CategoryCard(
                      categoryName: entry.key.categoryName,
                      totalTasks: entry.value.totalTaskCount,
                      completedTasks: entry.value.completedTaskCount,
                      categoryColor: entry.key.categoryColor))
                  .toList()),
        ),
      ),
    );
  }
}

class _ViewModel {
  final Map<TaskCategory, CategoryData> categories;

  _ViewModel({
    required this.categories,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    print(store.state);
    return _ViewModel(categories: categoriesSelector(store.state));
  }
}
