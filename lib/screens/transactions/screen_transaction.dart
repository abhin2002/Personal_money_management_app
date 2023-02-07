import'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(6),
      itemBuilder: (ctx, insex){
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
      itemCount: 10
    );
  }
}