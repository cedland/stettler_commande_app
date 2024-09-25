import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../AgemoModels/cart_item_model.dart';
import '../AgemoModels/product_model.dart';


class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(ProductModel product, int quantity, String selectedVariant) {
    var existingCartItem = _cartItems.firstWhereOrNull(
          (item) => item.product.codArt == product.codArt,
    );

    if (existingCartItem != null) {
      existingCartItem.quantity += quantity;
    } else {
      _cartItems.add(CartItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  int getProductQuantity(int productId) {
    int quantity = 0;
    for (CartItem item in _cartItems) {
      if (item.product.codArt == productId) {
        quantity += item.quantity;
      }
    }
    return quantity;
  }

  int get cartCount {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _cartItems.fold(
        0.0, (sum, item) => sum + (item.product.prices * item.quantity));
  }

  void updateCartItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void increaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseCartItemQuantity(int index) {
    if (index >= 0 && index < _cartItems.length) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
        notifyListeners();
      } else {
        // If the quantity is 1, remove the item from the cart
        _cartItems.removeAt(index);
        notifyListeners();
      }
    }
  }

  void removeCartItem(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  List<CartItem> getCartItemsList() {
    return List<CartItem>.from(_cartItems);
  }
}