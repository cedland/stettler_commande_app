import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../AgemoModels/product_model.dart';
import '../../../AgemoProvider/cart_provider.dart';
import '../../couleurs.dart';
import 'package:badges/badges.dart' as badges;

import 'cart_details.dart';
class ProductDetailCommand extends StatefulWidget {
  const ProductDetailCommand({super.key, required this.quantity, required this.product ,required this.quantityList, required this.totalPrice,});
  final ValueNotifier<int> quantity;
  final ProductModel product;
  final List<int>? quantityList;
  final ValueNotifier<double>? totalPrice;

  @override
  State<ProductDetailCommand> createState() => _ProductDetailCommandState();
}

class _ProductDetailCommandState extends State<ProductDetailCommand> with SingleTickerProviderStateMixin {

  late TabController tabController;

  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }
  void _decrementQuantity() {
    setState(() {
      _quantity--;
    });
  }



  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

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
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) =>
                      const CartDetails()));
            },
            child: Row(
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
                          highlightColor:Colors.transparent,
                        onPressed: null
                      ),
                    );
                  },
                ),
                 SizedBox(
                  width: screenWidth/72,
                )
              ],
            ),
          )
        ],
        backgroundColor:appbarColor,
        centerTitle: true,
        title: Text("DETAIL PRODUIT",
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'LatoBold',
              color: Colors.white
          ),),
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/60,horizontal: screenWidth/20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth,
                  //height: screenHeight/26,
                  child: Container(
                    width: screenWidth,
                    child: Text(
                      '${widget.product.codArt} ${widget.product.desArtf}',
                      style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  //height: screenHeight/26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'REF : ${widget.product.grpArt}',
                          style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                      ),
                      Container(
                        //width: screenWidth * 0.5,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '${widget.product.prices.toStringAsFixed(2)} CHF',
                              style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  //height: screenHeight/26,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'La boîte',
                          style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',)
                      ),

                      Container(
                        // width: screenWidth * 0.13,
                        // height: screenHeight/30,
                        padding:  EdgeInsets.symmetric( horizontal: screenWidth/50,),
                        decoration: BoxDecoration(
                          color: appbarColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                              'Stock : ${widget.product.stock.toString()}',
                              style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',color: Colors.white)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:screenHeight/40),
                  child: Container(
                      height: screenHeight/4.27,
                      width: double.infinity,
                      child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.product.codArt,
                          child: CachedNetworkImage(
                            imageUrl: "",
                            //imageUrl: "${url}image/${productinfo.product_image_url}",
                            fit: BoxFit.cover,
                            width: screenWidth/5.14,
                            height: screenHeight/4.57,
                            placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Image.asset('assets/images/1.jpg',height: screenHeight/10.57,width: screenWidth/5.14,fit: BoxFit.cover),
                          )),
                  ),
                ),
                Container(
                    width: screenWidth,
                    height: screenHeight/3.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                                children:[
                                  TabBar(
                                    controller: tabController,
                                    tabs: [
                                      Tab(child: Text('Informations',
                                          style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                                      ),),
                                      Tab(child: Text('Ingrédients',
                                          style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',)
                                      ),),
                                    ],
                                    labelColor: Colors.black,
                                  ),
                                  Expanded(child: TabBarView(
                                    controller: tabController,
                                    children:  [
                                      Center(child: Text(widget.product.descr2F!,
                                        style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
                                      Center(child: Text(widget.product.remIntf!,
                                        style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
                                    ],

                                  ))
                                ]
                            ),
                          )
                        ],
                      ),
                    )
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: screenHeight/50),
                  child: Container(
                    width: screenWidth,
                    height: screenHeight/9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    // margin: const EdgeInsets.only(left:12, right:12 ,bottom: 12),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth/35,vertical: screenHeight/200),
                            child: Text(
                              'Quantité',
                              style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              //onPressed: _decreaseQuantity,
                              icon:  Icon(
                                Icons.remove_circle,
                                size: 30,
                                color: appbarColor,
                              ),
                              //onPressed:_decreaseQuantity,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed:  _quantity <= 1 ? null : _decrementQuantity,
                            ),
                            SizedBox(width: screenWidth/36,),
                            //Text('${widget.quantity.value}',style:TextStyle(fontSize: 20, fontFamily: 'LatoBold'),),
                            Text(
                              '$_quantity',
                              style:TextStyle(fontSize: 20, fontFamily: 'LatoBold'),
                            ),

                            SizedBox(width: screenWidth/36,),
                            IconButton(
                              // onPressed: _increaseQuantity,
                              icon:  Icon(
                                  Icons.add_circle,
                                  size: 30,
                                  color: appbarColor
                              ),
                              //onPressed: _increaseQuantity,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: _incrementQuantity,

                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/40,),
                InkWell(
                  onTap: (){
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(widget.product, _quantity, "");
                    setState(() {
                      _quantity = 1;
                    });
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight/14.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appbarColor,
                    ),
                    child: Center(
                      child: Text("AJOUTER AU PANIER", style: TextStyle(fontSize: 16, fontFamily: 'LatoBold',color: Colors.white),),
                    ),

                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
