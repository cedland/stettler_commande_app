import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AgemoModels/cart_item_model.dart';
import '../../../AgemoProvider/cart_provider.dart';


class CartListShopItem extends StatefulWidget {
  final CartItem cartItem;
  final int index;
  final void Function() delete;
  const CartListShopItem({super.key, required this.cartItem, required this.index, required this.delete});

  @override
  State<CartListShopItem> createState() => _CartListShopItemState();
}

class _CartListShopItemState extends State<CartListShopItem> {
  String currency = "₦";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: screenHeight/185),
      child: Card(
        color: Colors.grey.shade50,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              width: screenWidth/6,
              height:screenHeight/12.3,
              decoration: BoxDecoration(color: Colors.grey.shade50),
              child: Container(
                margin: EdgeInsets.all(3),
                width: screenWidth/6,
                height: screenHeight/12.3,
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: widget.cartItem.product.codArt,
                    child: CachedNetworkImage(
                      imageUrl: "",
                      //imageUrl: "${url}image/${widget.cartItem.product.''}",
                      fit: BoxFit.cover,
                      width: screenWidth/6,
                      height: screenHeight/12.3,
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset('assets/images/1.jpg',height: screenHeight/12.3,width: screenWidth/6,fit: BoxFit.cover),
                    )),
              ),
            ),
            //const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.yellow,
                  width: screenWidth/1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth/2,
                        child: Align(
                          alignment:Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.cartItem.product.desArtf,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                            ),
                          ),
                        ),
                      ),
                      IconButton(onPressed: widget.delete, icon: const Icon(
                        Icons.cancel,
                      ),
                          highlightColor: Colors.transparent)
                    ],
                  ),
                ),
                Container(
                  width: screenWidth/1.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth/6,
                        child: Align(
                          alignment:Alignment.topLeft,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${widget.cartItem.product.prices.toString()}CHF',
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        //width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade50,
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenWidth/12,
                                  height: screenHeight/24.66,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(255, 229, 36, 36),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){
                                      if (quantity >= 1) {
                                        Provider.of<CartProvider>(context,
                                            listen: false)
                                            .decreaseCartItemQuantity(widget.index);
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                 SizedBox(width: screenWidth/24,),
                                Text(
                                  widget.cartItem.quantity.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 16),
                                ),
                                 SizedBox(width: screenWidth/24,),
                                Container(
                                  width: screenWidth/12,
                                  height: screenHeight/24.66,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(255, 229, 36, 36),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: (){
                                      Provider.of<CartProvider>(context,
                                          listen: false)
                                          .increaseCartItemQuantity(widget.index);
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}