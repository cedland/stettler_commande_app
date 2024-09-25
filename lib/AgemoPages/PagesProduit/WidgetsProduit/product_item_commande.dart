import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stettler_livraison/AgemoPages/PagesProduit/WidgetsProduit/product_detail_command.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';
import '../../../AgemoModels/product_model.dart';

import '../../../AgemoProvider/cart_provider.dart';
class ProductItemCommande extends StatefulWidget {
  const ProductItemCommande({
    super.key, required this.id, required this.product_name, required this.product_reference, required this.product_price, required this.product_quantity, required this.product_image_url, required this.quantity, required this.product,  this.cartProducts,  this.quantityList, this.totalPrice,

  });
  final double id;
  final String product_name;
  final double product_reference;
  final double product_price;
  final double product_quantity;
  final String product_image_url;
  final ValueNotifier<int> quantity;
  final ProductModel product;
  final List<ProductModel>? cartProducts;
  final List<int>? quantityList;
  final ValueNotifier<double>? totalPrice;

  @override
  State<ProductItemCommande> createState() => _ProductItemCommandeState();
}

class _ProductItemCommandeState extends State<ProductItemCommande> {
  final TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetailCommand(quantity: widget.quantity, product: widget.product,  quantityList: widget.quantityList, totalPrice: widget.totalPrice, ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight/80),
        child: Container(
          width: screenWidth,
          height: screenHeight/8.22,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                width: screenWidth/4.5,
                height: screenHeight/9.25,
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                  width: screenWidth/4.5,
                  height: screenHeight/9.25,
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Hero(
                        transitionOnUserGestures: true,
                        tag: widget.product.codArt,
                        child: CachedNetworkImage(
                          imageUrl: '',
                         // imageUrl: "${url}image/${widget.product_image_url}",
                          fit: BoxFit.cover,
                          width: screenWidth/5.14,
                          height: screenHeight/10.57,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Image.asset('assets/images/1.jpg',height: screenHeight/10.57,width: screenWidth/5.14,fit: BoxFit.cover),
                        )),
                  ),
                ),
              ),
              SizedBox(width: screenWidth/72,),
              Container(
                  width: screenWidth/1.9,
                  height: screenHeight/8.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth/2,
                        //color: Colors.black,
                        height: screenHeight/16.44,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenWidth/2,
                                  height: screenHeight/30,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                            '${widget.product_reference.toString()}',
                                            style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: screenWidth/2,
                                  child: Align(alignment: Alignment.topLeft,
                                      child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                        widget.product_name,
                                        style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                    ),
                                  ),
                                                                    ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth/2,
                        height: screenHeight/18.5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                  'Stock:',
                                  style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('${widget.product_quantity.toString()}',
                                    style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: screenHeight/100),
                      child: Container(
                        width: screenWidth/8,
                        height: screenHeight/30,
                        //color: Colors.blue,
                        padding:  EdgeInsets.symmetric( horizontal: screenWidth/50,),
                        decoration: BoxDecoration(
                          color: appbarColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                              '${widget.product_price.toString()} CHF',
                              style: TextStyle(fontSize: 13, fontFamily: 'LatoBold',color: Colors.white)
                          ),
                        ),
                      ),
                    ),

                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.add_circle),
                    color: const Color.fromARGB(255, 52, 51, 56),
                    highlightColor:Colors.transparent,
                    onPressed: (){
                      showDialog(
                        context: context, // Provide the context of your widget
                        builder: (_) {
                          return AlertDialog(
                            title: const Center(child: Text("Entrer la quantité à ajouter  ", style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))),
                            content: TextFormField(
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                              decoration:  InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black), //<-- SEE HERE
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black), //<-- SEE HERE
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || int.parse(quantityController.text) ==0 || int.parse(quantityController.text) <0) {
                                  return 'veuillez entrer la quantité du produit';
                                }
                                return null;
                              },
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    Provider.of<CartProvider>(context, listen: false)
                                        .addToCart(widget.product, int.parse(quantityController.text), "");
                                    Navigator.of(context).pop();
                                    quantityController.clear();
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
                                    const Text("Ajouter",
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
                                    const Text("Annuler",
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white)),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
