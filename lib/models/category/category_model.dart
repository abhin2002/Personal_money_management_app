
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';

enum CategoryType{
  income,
  expense,
}

@HiveType(typeId: 1)
class CategoryModel{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;  //for category name

  @HiveField(2)
  final bool isDeleted;    //soft deleting and displaying

  @HiveField(3)
  final CategoryType type;

  CategoryModel({
    required this.id, 
    required this.name,
    required this.type, 
    this.isDeleted = false
    });
}