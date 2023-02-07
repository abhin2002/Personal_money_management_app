import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card
        (
          child: ListTile(
            title: Text('Expense Category $index'),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            ),
          ),
        );
      }, 
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      }, 
      itemCount: 100);
  }
}