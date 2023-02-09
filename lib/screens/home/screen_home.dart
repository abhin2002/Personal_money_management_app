//import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import'package:flutter/material.dart';
import 'package:personal_money_management_app/db/category/category_db.dart';
import 'package:personal_money_management_app/models/category/category_model.dart';
import 'package:personal_money_management_app/screens/category/category_add_popup.dart';
import 'package:personal_money_management_app/screens/category/screen_catogory.dart';
import 'package:personal_money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:personal_money_management_app/screens/transactions/screen_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);  //for bottom navigation b/w pages
  final _pages = const [                  //page list to change home page according to bottom navigation
    ScreenTransactions(),
    ScreenCatogory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: Text('Money Manager'),
      //centerTitle: true,
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(), //take bottom navigation in homeScreen
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder:(BuildContext context,int updatedIndex, _){
            return _pages[updatedIndex];
          }
          )
        ),
        floatingActionButton: FloatingActionButton(   //plus button
          onPressed: (){     
            if(selectedIndexNotifier.value ==0){
              print("Add transactions");
            }
            else{
              print("Add catogy");
              showCategoryAddPopup(context);
              // final _sample = CategoryModel(
              //   id: DateTime.now().millisecondsSinceEpoch.toString(),
              //   name: 'Travel',
              //   type: CategoryType.expense,
              //   );
              //   CategoryDB().insertCategory(_sample);
            }
          
        },
        child: Icon(Icons.add),
        ),
    );
  }
}