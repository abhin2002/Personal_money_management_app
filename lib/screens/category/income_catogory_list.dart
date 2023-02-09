import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../db/category/category_db.dart';
import '../../models/category/category_model.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

   @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener, 
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return ListView.separated(
      itemBuilder: (context, index) {
        final category = newList[index];
        return Card
        (
          child: ListTile(
            title: Text(category.name),
            trailing: IconButton(
              onPressed: () {
                CategoryDB.instance.deleteCategory(category.id);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        );
      }, 
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      }, 
      itemCount: newList.length);
      },
    );
  }
}