import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../../AgemoModels/cart_item_model.dart';
import '../../../AgemoProvider/cart_provider.dart';
import '../../couleurs.dart';
import 'cart_list_shop_item.dart';
import 'package:gif/gif.dart';


class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> with TickerProviderStateMixin {
  String currency = "₦";

  late final GifController _controller;

  @override
  void initState() {
    _controller = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_back_sharp),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
        ),
        actions: [
          Row(
            children: [
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return badges.Badge(
                    position: badges.BadgePosition.bottomEnd(bottom: 1, end: 1),
                    badgeContent: Text(
                      cartProvider.cartCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.local_mall,color: Colors.white,),
                      iconSize: 25,
                      onPressed: null
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.delete,color: Colors.white,),
                  iconSize: 25,
                  highlightColor:Colors.transparent,
                  onPressed: (){
                    showDialog(
                      context: context, // Provide the context of your widget
                      builder: (_) {
                        return AlertDialog(
                          title: const Center(child: Text("Voulez-vous vider le panier ? ", style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold))),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(onPressed: (){
                                  Provider.of<CartProvider>(context,
                                      listen: false)
                                      .clearCart();
                                  Navigator.of(context).pop();
                                },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Colors.green),

                                  ), child:
                                  const Text("OUI",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                                ElevatedButton(onPressed: (){
                                  //Navigator.of(context).pop;
                                  Navigator.of(context).pop();
                                },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        // Change your radius here
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(appbarColor),

                                  ), child:
                                  const Text("NON",
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }
              ),
            ],
          )
        ],
        backgroundColor:appbarColor,
        centerTitle: true,
        title: Text("Panier",
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'LatoBold',
              color: Colors.white
          ),),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final List<CartItem> cartItems =
                      cartProvider.cartItems;
                  if (cartItems.isEmpty) {
                    return  Gif(
                      image: const AssetImage("assets/images/empty.gif"),
                      controller: _controller, // if duration and fps is null, original gif fps will be used.
                      //fps: 30,
                      //duration: const Duration(seconds: 3),
                      autostart: Autostart.no,
                      placeholder: (context) => const Text('Loading...'),
                      onFetchCompleted: () {
                        _controller.reset();
                        _controller.forward();
                      },
                    );
                  }
                  return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return CartListShopItem(
                        cartItem: cartItem,
                        index: index,
                        delete: () {
                          Provider.of<CartProvider>(context,
                              listen: false)
                              .removeCartItem(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                final List<CartItem> cartItems = cartProvider.cartItems;
                return cartItems.isEmpty? Container():Padding(
                  padding:  EdgeInsets.symmetric(vertical: screenHeight/20),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                   // margin: EdgeInsets.symmetric(vertical: screenHeight/74,horizontal: screenWidth/90),
                    //padding: const EdgeInsets.all(10),
                    width: screenWidth,
                    height: screenHeight/6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: screenWidth/60),
                         child: Container(
                            width: screenWidth,
                            height: screenHeight/18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //const Spacer(),
                                 SizedBox(
                                  width: screenWidth/2.4,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Code Promo',
                                        hintStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        backgroundColor:
                                        MaterialStateProperty.all(appbarColor,)),
                                    onPressed: () {},
                                    child:  Text('Appliquer',
                                        style:TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),
                                        textAlign: TextAlign.center))
                              ],
                            ),
                          ),
                       ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth/60),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight/25,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Montant total',
                                  style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                                ),
                                const Spacer(),

                                SizedBox(
                                  width: screenWidth/36,
                                ),
                                Text(
                                  ('${cartProvider.totalPrice.toStringAsFixed(2)} CHF'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            width: screenWidth,
                            height: screenHeight/17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: appbarColor,
                            ),
                            child: Center(
                              child: Text("VALIDER LA COMMANDE", style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white),),
                            ),

                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}