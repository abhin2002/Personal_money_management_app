import'package:flutter/material.dart';
import 'package:personal_money_management_app/screens/category/expense_category_list.dart';
import 'package:personal_money_management_app/screens/category/income_catogory_list.dart';

import '../../db/category/category_db.dart';

class ScreenCatogory extends StatefulWidget {
  const ScreenCatogory({super.key});

  @override
  State<ScreenCatogory> createState() => _ScreenCatogoryState();
}

class _ScreenCatogoryState extends State<ScreenCatogory> with SingleTickerProviderStateMixin{   //tap bar can only be created in statefull widget
  
  late TabController _tabController;

  
  @override
  void initState(){
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children:[
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: const [
          Tab(text: 'INCOME'),
          Tab(text: 'EXPENSE'),  
        ]
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
            IncomeCategoryList(),
            ExpenseCategoryList(),
          ]
          
          ),
        )
      ],
    );
  }
}