
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_money_management_app/db/category/category_db.dart';
import 'package:personal_money_management_app/db/transactions/transaction_db.dart';
import 'package:personal_money_management_app/models/category/category_model.dart';
import 'package:personal_money_management_app/models/transaction/transaction_model.dart';

class ScreenaddTransaction extends StatefulWidget {
  static const routeName = 'add-transaction';
  const ScreenaddTransaction({super.key});

  @override
  State<ScreenaddTransaction> createState() => _ScreenaddTransactionState();
}

class _ScreenaddTransactionState extends State<ScreenaddTransaction> {
DateTime? _selectedDate;
CategoryType? _selectedcetegorytype;
CategoryModel? _selectedcategoryModel;

String? _categoryID;

final _purposeTextEditingController = TextEditingController();
final _amountTextEditingController = TextEditingController();

  @override
  void initState(){
    _selectedcetegorytype = CategoryType.income;
    super.initState();
  }

  //for input dont use list view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //purpose
                TextFormField(
                  controller: _purposeTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Purpose',
                  ),
                ),
                //amount
                TextFormField(
                  controller: _amountTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Amount',
                  )
                ),

                //calender
               
                TextButton.icon(onPressed: () async {

                  final _selectedDateTemp  = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now(),
                  );

                  if(_selectedDateTemp == null){
                    return;
                  }else{
                    print(_selectedDateTemp.toString());
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });

                  }
                },
                icon: const Icon(Icons.calendar_today),
                label:  Text(_selectedDate == null ?'Select Date' : _selectedDate!.toString()),
                ),
               
                //input or expense
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: CategoryType.income,
                            groupValue: _selectedcetegorytype,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedcetegorytype = CategoryType.income;
                                _categoryID = null;
                              });
                              
                            },
                            
                          ),
                          Text('Income'),
                        ],
                      ),

                      Row(
                        children: [
                          Radio(
                            value: CategoryType.expense,
                            groupValue: _selectedcetegorytype,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedcetegorytype = CategoryType.expense;
                                _categoryID = null;
                              });
                              
                            },
                          ),
                          Text('Expense'),
                        ],
                      ),
                    ],
                  ),

              //category type
              DropdownButton(
                hint: const Text('Select Category'),
                value: _categoryID,
                items: (_selectedcetegorytype == CategoryType.income? 
                  CategoryDB().incomeCategoryListListener 
                : CategoryDB().expenseCategoryListListener)
                .value.map((e) {
                  return DropdownMenuItem(
                    value: e.id,
                    child: Text(e.name),
                    onTap: () {
                      _selectedcategoryModel = e;
                    },
                  );
                }).toList(), 
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                },
              ),  

              //submit

              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.check),
                label: Text('Submit'),
              ),                  
                
              ],
            ),
          )
        ), 
      );
  }

  Future<void> addTransaction() async {
    final _purposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;
    if(_purposeText.isEmpty){
      return;
    }
    if(_categoryID == null){
      return;
    }
    if(_amountText.isEmpty){
      return;
    }
    if(_selectedDate == null){
      return;
    }

    if(_selectedcategoryModel == null){
      return;
    }

    final _parsedAmount = double.tryParse(_amountText);
    if(_parsedAmount == null){
      return;
    }
    //_selectedDate
    //_selectedcetegorytype

    final _model =Transaction(
      purpose: _purposeText,
      amount: _parsedAmount,
      date: _selectedDate!,
      type: _selectedcetegorytype!,
      category: _selectedcategoryModel!,
    );

    TransactionDB.instance.addTransaction(_model);
  }
}