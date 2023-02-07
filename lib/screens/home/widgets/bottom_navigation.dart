// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import'package:flutter/material.dart';
import 'package:personal_money_management_app/screens/home/screen_home.dart';
class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _){
        return BottomNavigationBar(
        //to change current index according to selected index notifier
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: updatedIndex,//bottom navigation selection changes
        onTap: (newIndex){
          ScreenHome.selectedIndexNotifier.value = newIndex; //on taping value changes
        },
        items: const [  //no changes, hense make total array as const
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Transactions'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.category),
        label: 'Catogories'
        ),
      ],
      );
      }, 
    );
  }
}