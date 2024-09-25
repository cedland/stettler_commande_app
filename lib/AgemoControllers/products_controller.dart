import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../AgemoModels/product_model.dart';
import '../AgemoConstant/constants.dart';

class ProductsController extends GetxController {
  final isLoading = false.obs;
  final box = GetStorage();
  List categoryListApi = [];
  List produitListByCategory = [];
  Rx<List<ProductModel>> product = Rx<List<ProductModel>>([]);
  List<ProductModel> productsList = [];


  Future<ProductModel> getOneProductApi(id) async {
    try {
      http.Response response = await http.get(Uri.parse('${urlOneProduct}$id'),
          headers: {
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body)['data'];
        //print(jsonResponse);
        return ProductModel.fromJson(jsonResponse);
      } else {
        throw Exception('Erreur: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed in edit user');
    }
  }

  Future getAllProductApi(id) async{
    try{
      isLoading.value = true;
      product.value.clear();
      productsList.clear();
      var response = await http.get(
          Uri.parse('${urlProduct}$id'),
          headers: {
            'Accept': 'application/json',
          });
      if(response.statusCode == 200){
        isLoading.value = false;
        final contents = json.decode(response.body)['data'];
        produitListByCategory = contents;
        for(var item in contents){
          product.value.add(ProductModel.fromJson(item));
          productsList.add(ProductModel.fromJson(item));
        }
      }else{
        isLoading.value = false;
        print(json.decode(response.body));
      }

    }catch(e){
      isLoading.value = false;
      print(e.toString());
    }
  }



  Future getAllCategoryApi() async{
    try{
      isLoading.value = true;
      var response = await http.get(
          Uri.parse('${urlCategory}'),
          headers: {
            'Accept': 'application/json',
          });
      if(response.statusCode == 200){
        isLoading.value = false;
        final contents = json.decode(response.body)['data'];
        categoryListApi = contents;
      }else{
        isLoading.value = false;
        print(json.decode(response.body));
      }

    }catch(e){
      isLoading.value = false;
      print(e.toString());
    }
  }

}