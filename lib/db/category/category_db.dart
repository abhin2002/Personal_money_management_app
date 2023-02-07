import 'package:personal_money_management_app/models/category/category_model.dart';

abstract class CategoryDbFunctions{
  //List<CategoryModel> getCategory();
  Future <void> insertCategory(CategoryModel value);
}

class CategoryDB implements CategoryDbFunctions{

  @override
  Future<void> insertCategory(CategoryModel value) async{}

}