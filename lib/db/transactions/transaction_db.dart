import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:personal_money_management_app/models/transaction/transaction_model.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunctions{
  Future<void> addTransaction(Transaction obj);
  Future<List<Transaction>> getTransactions();
}

class TransactionDB implements TransactionDbFunctions{
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB(){
    return instance;
  }

  ValueNotifier<List<Transaction>> transactionListNotifier = 
    ValueNotifier([]);

  @override
  Future<void> addTransaction(Transaction obj) async{
    final _db = await Hive.openBox<Transaction>(TRANSACTION_DB_NAME);
    await _db .put(obj.id, obj);
  }

  Future<void> refresh() async{
    final _list = await getTransactions();
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(_list);
  }
  
  @override
  Future<List<Transaction>> getTransactions() async {
    final _db = await Hive.openBox<Transaction>(TRANSACTION_DB_NAME);
    return _db.values.toList(); 
  }

}