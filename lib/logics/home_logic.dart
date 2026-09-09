import 'package:mini_store/models/product_models.dart';

class HomeLogic {

 static List<ProductModels> filterSearch(String name,List<ProductModels> products){
   if (name.isEmpty) {
     return products;
   }
   final String search=name.trim().toLowerCase();
   return products.where((element) => element.name.toLowerCase().contains(search)).toList();
  }
}