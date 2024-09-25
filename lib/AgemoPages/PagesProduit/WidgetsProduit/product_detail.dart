import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoModels/product_model.dart';
import '../../PageClient/WidgetsCustomer/custom_app_bar.dart';
import '../../couleurs.dart';


class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<ProductModel> contentProduct = [];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(
        title: 'DETAIL PRODUIT',
        function: CustomAppBarFunction.back,
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
                  padding: EdgeInsets.symmetric(vertical:screenHeight/20),
                  child: Container(
                    height: screenHeight/3.27,
                    width: double.infinity,
                    child:   Hero(
                        transitionOnUserGestures: true,
                        tag: widget.product.codArt,
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
                Container(
                    width: screenWidth,
                    height: screenHeight/3,
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
                                      Center(child: Text(widget.product.descr2F,
                                        style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
                                      Center(child: Text(widget.product.remIntf,
                                        style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',),)),
                                    ],

                                  ))
                                ]
                            ),
                          )
                        ],
                      ),
                    )),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
