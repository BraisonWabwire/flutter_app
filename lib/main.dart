import 'package:flutter_app/data/grocery_data.dart';

void main() {
  var firstProduct = GroceryData.groceryProducts;

  print(firstProduct[5]['description']);
}
