import 'package:mini_store/models/product_models.dart';

class HomeLogic {
  static List<ProductModels> filterSearch(
    String name,
    List<ProductModels> products,
  ) {
    final String search = name.trim().toLowerCase();

    if (search.isEmpty) {
      return products;
    }
    
    return products
        .where((element) => element.name.toLowerCase().contains(search))
        .toList();
  }

  static List<ProductModels> filterCategory(Categories? category,List<ProductModels>products) {
    if (category == null) {
      return products;
    }
    return products.where((element) => element.category==category,).toList();
  }
}
