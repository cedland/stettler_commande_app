import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AgemoControllers/products_controller.dart';
import '../../AgemoModels/product_model.dart';
import '../app_bar.dart';
import '../couleurs.dart';
import 'WidgetsProduit/product_item.dart';


class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final TextEditingController keyword = TextEditingController();
  final TextEditingController keywordCategory = TextEditingController();
  final ProductsController _productsController = Get.put(ProductsController());
  int selectedIndex =-1;
  List<ProductModel> _foundProduct =[];
  List content = [];
  List<ProductModel> contentProduct = [];
  List _foundCategory = [];
  List items =[];
  List itemsIdInternet =[];
  List subitemsIdInternet =[];
  List subitems =[];
  int index =0;

  Future getCategoryApi() async{
    await _productsController.getAllCategoryApi();
    setState(() {
      content = _productsController.categoryListApi;
      _foundCategory = content;

      index = _foundCategory[0]['IdArtStructureInternet'];
    });
    await _productsController.getAllProductApi(index);
    setState(() {
      contentProduct = _productsController.productsList;
      _foundProduct = contentProduct;
    });
  }

  void _runFilterProduct(String enteredKeyword) {
    List<ProductModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = contentProduct;
    } else {
      results = contentProduct
          .where((user) => user.desArtf.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundProduct = results;
    });
  }


  void _runFilterCategory(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = content;
    } else {
      results = content
          .where((user) => user['Designation_FR'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundCategory = results;
    });
  }
    @override
    initState() {
      getCategoryApi();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(title: "LISTE DES PRODUITS", function: CustomAppBarFunction.back),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/60,horizontal: screenWidth/20),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: screenHeight/16,
                  width: screenWidth/0.94,
                  child: TextFormField(
                      controller: keyword,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Entrer le nom du produit",
                          hintStyle:  TextStyle(
                              fontSize: 12,
                              fontFamily: "LatoRegular",
                              color: Colors.black
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(CupertinoIcons.search, color:  Colors.black),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),

                              ),
                              borderSide: BorderSide(
                                  color: Colors.transparent
                              )
                          ),enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),

                          ),
                          borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 2.0
                          )
                      )
                      ),
                      onChanged: (value) => _runFilterProduct(value),
                      style: const TextStyle(fontSize: 13,color: Colors.black,fontFamily: "LatoRegular")
                  ),
                ),
                SizedBox(height: screenHeight/40,),
                //const SizedBox(height: 15,),
                Container(
                  width: screenWidth,
                  height: screenHeight/6,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: screenWidth/50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Catégories', style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),),
                               Center(
                                child: Container(
                                  width: screenWidth/2,
                                  height: screenHeight/24,
                                  child: TextFormField(
                                    controller: keywordCategory,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth/36),
                                      border:  OutlineInputBorder(),
                                      hintText: 'Entrer la catégorie',
                                      hintStyle:  TextStyle(
                                          fontSize: 12,
                                          fontFamily: "LatoRegular",
                                          color: Colors.black
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade50,
                                      prefixIcon: Icon(CupertinoIcons.search, color:  Colors.grey,size: 18,),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),

                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.transparent
                                            )
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              topLeft: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8),

                                            ),
                                            borderSide: BorderSide(
                                                color: Colors.transparent
                                            )
                                        ),
                                    ),
                                     onChanged: (value) =>_runFilterCategory(value),
                                      style: const TextStyle(fontSize: 12,color: Colors.black,fontFamily: "LatoRegular")
                                  ),
                                ),
                              ),
                              InkWell(onTap:(){
                                setState(() {
                                  //_foundProducts = productList;
                                  _foundCategory = content;
                                  keyword.text = "";
                                  keywordCategory.text="";
                                  selectedIndex = -1;
                                });
                              },child: Icon(Icons.update,color: appbarColor, size: 22,))
                            ],
                          ),
                        ),
                        // SizedBox(height: screenHeight/100,),
                        Obx(() {
                          return _productsController.isLoading.value
                              ? const Center(
                            child: CircularProgressIndicator(),
                          ): _foundCategory.isEmpty ?
                          Padding(
                            padding:  EdgeInsets.only(top: screenHeight/60),
                            child: const Center(child: Text("Aucune catégorie trouvée", style:TextStyle(fontSize: 12,color: Colors.red,fontFamily: "LatoRegular"))),
                          )

                              :Container(
                            height: screenHeight/9.86,
                                child: SingleChildScrollView(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: _foundCategory.length,
                                    //itemCount: _foundProducts.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:  EdgeInsets.symmetric(horizontal:screenWidth/72,vertical: screenHeight/148),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              selectedIndex = index;
                                              items = [];
                                              itemsIdInternet =[];
                                              subitems =[];
                                              subitemsIdInternet =[];
                                            });

                                            for(var item in _foundCategory[index]['categories']){
                                              items.add(item['Designation_FR']);
                                              itemsIdInternet.add(item['IdArtStructureInternet']);
                                            }

                                           for(int id=0 ; id < items.length;id++){
                                              for(var item in _foundCategory[index]['categories'][id]['sub_categories']){
                                                subitems.add(item['Designation_FR']);
                                                subitemsIdInternet.add(item['IdArtStructureInternet']);
                                              }
                                            }
                                            showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return StatefulBuilder(builder: (stfContext, stfSetState) {
                                                  return AlertDialog(
                                                    title: GestureDetector(
                                                        onTap:() async {
                                                          Navigator.pop(context);
                                                          await _productsController.getAllProductApi(content[index]['IdArtStructureInternet']);
                                                          setState(() {
                                                            contentProduct = _productsController.productsList;
                                                            _foundProduct = contentProduct;
                                                          });


                                                    },
                                                        child: Text("Tous les produits ", style: TextStyle(fontSize: 15, fontFamily: "LatoBold"))),
                                                    content: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: items.length,
                                                      itemBuilder: (BuildContext context, int index) {
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: screenHeight/70),
                                                              child: GestureDetector(
                                                                  onTap:() async {
                                                                    Navigator.pop(context);
                                                                    await _productsController.getAllProductApi(itemsIdInternet[index]);
                                                                    setState(() {
                                                                      contentProduct = _productsController.productsList;
                                                                      _foundProduct = contentProduct;
                                                                    });
                                                                  },
                                                                  child: Text("${items[index]}", style: TextStyle(fontSize: 14, fontFamily: "LatoBold"))),
                                                            ),
                                                            ListView.builder(
                                                              shrinkWrap: true,
                                                              physics: const NeverScrollableScrollPhysics(),
                                                              itemCount: subitems.length,
                                                              itemBuilder: (BuildContext context, int index) {
                                                                return Padding(
                                                                  padding:  EdgeInsets.symmetric(vertical:screenHeight/90),
                                                                  child: GestureDetector(
                                                                      onTap:() async {
                                                                        Navigator.pop(context);
                                                                        await _productsController.getAllProductApi(subitemsIdInternet[index]);
                                                                        setState(() {
                                                                          contentProduct = _productsController.productsList;
                                                                          _foundProduct = contentProduct;
                                                                        });
                                                                      },
                                                                      child: Text("${subitems[index]}", style: TextStyle(fontSize: 14, fontFamily: "LatoRegular"))),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                });
                                              },
                                            );
                                          },
                                          child: Text("${content[index]['Designation_FR']}",style: TextStyle(
                                            color: selectedIndex == index
                                                ? appbarColor
                                                : Colors.black,
                                              fontSize: 12
                                              ,fontFamily: "LatoRegular"
                                          ),),
                                        ),
                                      );
                                    })
                                                          ),
                              );
                        })
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/80,),

                Expanded(
                  child: Obx(() {
                    return _productsController.isLoading.value
                        ? const Center(
                      child: CircularProgressIndicator(),
                    ): _foundProduct.isEmpty ?
                    //_foundProducts.isEmpty && _foundProductsCategory.isEmpty?
                    const Center(child: Text("Aucun produit trouvé", style:TextStyle(fontSize: 16,color: Colors.red,fontFamily: "LatoRegular")))
                        :
                    SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _foundProduct.length,
                            //itemCount: _foundProducts.length,
                            itemBuilder: (context, index) {
                              return ProductItem(product: _foundProduct[index],);
                            })
                    );
                  }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
