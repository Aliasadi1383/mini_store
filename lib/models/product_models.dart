enum Categories{food,electronics,clothing,homeAppliances}

class ProductModels {
 final int id;
 final String name;
 final double price;
 final String imagePath;
 final double? oldPrice;
 final Categories category;
  
  const ProductModels({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    this.oldPrice
  });
}