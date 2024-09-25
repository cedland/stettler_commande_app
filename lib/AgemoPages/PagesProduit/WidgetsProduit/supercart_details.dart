import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../../AgemoModels/cart_item_model.dart';
import '../../../AgemoProvider/cart_provider.dart';
import 'cart_list_item.dart';


class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  String currency = "₦";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                              return badges.Badge(
                                position: badges.BadgePosition.bottomEnd(
                                    bottom: 1, end: 1),
                                badgeContent: Text(
                                  cartProvider.cartCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.local_mall),
                                  iconSize: 25,
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 80, top: 20),
                margin: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          final List<CartItem> cartItems =
                              cartProvider.cartItems;

                          if (cartItems.isEmpty) {
                            return Center(
                              child: Text(
                                'Your cart is empty.',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartItems[index];
                              return Dismissible(
                                key: Key(cartItem.product.codArt
                                    .toString()), // Use a unique key for each item
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  Provider.of<CartProvider>(context,
                                      listen: false)
                                      .removeCartItem(index);
                                },
                                child: GestureDetector(
                                    onTap: () {},
                                    child: CartListItem(
                                      cartItem: cartItem,
                                      index: index,
                                    )),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}