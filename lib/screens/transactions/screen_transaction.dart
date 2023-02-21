import'package:flutter/material.dart';
import 'package:personal_money_management_app/db/transactions/transaction_db.dart';

import '../../models/transaction/transaction_model.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext context, List<Transaction> newList, Widget? _) {
        ListView.separated(
      padding: const EdgeInsets.all(6),
      //values
      itemBuilder: (ctx, index){
        final _value = newList[index];
        return const Card(
          elevation: 0,
          child:ListTile(
            leading: CircleAvatar(
              radius: 50,
              child: Text('12\n dec',
                textAlign: TextAlign.center,
              )
            ),
          title: Text('Rs 100000'),
          subtitle: Text('Travel'),
          )
          
        );

      },
      separatorBuilder: (ctx, insex){
        return const SizedBox(height: 10,);

      }, 
      itemCount: newList.length,
    );
      }
    );
  }
}