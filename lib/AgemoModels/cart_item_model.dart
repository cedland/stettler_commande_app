import 'package:stettler_livraison/AgemoModels/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}