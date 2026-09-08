import 'package:mini_store/models/product_models.dart';


List<ProductModels> products = [
  ProductModels(
    id: 1,
    name: 'Chicken Pizza',
    price: 20.12,
    imagePath: 'assets/images/products/pizza.jpg',
    category: Categories.food,
  ),
  ProductModels(
    id: 2,
    name: 'Fried Chicken',
    price: 26.29,
    imagePath: 'assets/images/products/friedChicken.jpg',
    category: Categories.food,
    oldPrice: 40.14,
  ),

    ProductModels(
    id: 3,
    name: 'Turkish Coffee',
    price: 12.10,
    imagePath: 'assets/images/products/coffee.jpg',
    category: Categories.food,
  ),

    ProductModels(
    id: 4,
    name: 'Wireless Headphones',
    price: 70.11,
    imagePath: 'assets/images/products/headphones.jpg',
    category: Categories.electronics,
  ),
 
    ProductModels(
    id: 5,
    name: 'Ceramic SmartWatch',
    price: 125.34,
    imagePath: 'assets/images/products/smartWatch.png',
    category: Categories.electronics,
  ),
 
    ProductModels(
    id: 6,
    name: 'iPhone 16 Pro Max',
    price: 1100,
    imagePath: 'assets/images/products/iphone.webp',
    category: Categories.electronics,
    oldPrice: 1200,
  ),
    ProductModels(
    id: 7,
    name: 'Men\'s Suit',
    price: 400.65,
    imagePath: 'assets/images/products/suit.jpg',
    category: Categories.clothing,
  ),

   ProductModels(
    id: 8,
    name: 'Black Men\'s Shoes',
    price: 211.17,
    imagePath: 'assets/images/products/shoes.jpeg',
    category: Categories.clothing,
  ),

   ProductModels(
    id: 9,
    name: 'Men\'s T-Shirt',
    price: 98.33,
    imagePath: 'assets/images/products/tshirt.webp',
    category: Categories.clothing,
    oldPrice: 116.21,
  ),
     ProductModels(
    id: 10,
    name: 'Washing Machine',
    price: 700.36,
    imagePath: 'assets/images/products/washingMachine.jpg',
    category: Categories.homeAppliances,
  ),
   ProductModels(
    id: 11,
    name: 'Double Door Refrigerator',
    price: 934.46,
    imagePath: 'assets/images/products/refrigerator.webp',
    category: Categories.homeAppliances,
  ),
  ProductModels(
    id: 12,
    name: 'Gas Samovar',
    price: 256.99,
    imagePath: 'assets/images/products/samovar.jpg',
    category: Categories.homeAppliances,
    oldPrice: 312.66,
  ),
];
