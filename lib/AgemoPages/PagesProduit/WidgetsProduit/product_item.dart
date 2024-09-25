import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoPages/PagesProduit/WidgetsProduit/product_detail.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';

import '../../../AgemoModels/product_model.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductDetail(product: product,),
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
                  child: Hero(
                      transitionOnUserGestures: true,
                      tag: product.codArt,
                      child: CachedNetworkImage(
                        imageUrl: '',
                        fit: BoxFit.cover,
                        width: screenWidth/5.14,
                        height: screenHeight/10.57,
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset('assets/images/1.jpg',height: screenHeight/10.57,width: screenWidth/5.14,fit: BoxFit.cover),
                      )),
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
                                            '${product.grpArt.toString()}',
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
                                        product.desArtf,
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
                              child: Text('${product.stock.toString()}',
                                  style: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
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
                          '${product.prices.toString()} CHF',
                          style: TextStyle(fontSize: 13, fontFamily: 'LatoBold',color: Colors.white)
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
