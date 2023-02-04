//import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import'package:flutter/material.dart';
import 'package:personal_money_management_app/screens/home/widgets/bottom_navigation.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);  //for bottom navigation b/w pages

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MoneyManagerBottomNavigation(), //take bottom navigation in homeScreen
      body: SafeArea(
        child: Text('Home')
        ),
    );
  }
}