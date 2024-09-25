import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import '../AgemoModels/customer_model.dart';
import '../AgemoConstant/constants.dart';


class CustomerController extends GetxController {
  final isLoading = false.obs;
  final box = GetStorage();
  List<CustomerModel> OneCustomer = [];

  Rx<List<CustomerModel>> customers = Rx<List<CustomerModel>>([]);
  List<CustomerModel> customerList = [];
  List<CustomerModel> agemoList = [];
  List<CustomerModel> manorList = [];
  List<CustomerModel> domigList = [];

  Future getOneCustomer(id) async{
    try{
      OneCustomer.clear();
      isLoading.value = true;
      var response = await http.get(
          Uri.parse('${urlCustomers}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      if(response.statusCode == 200){
        isLoading.value = false;
        final contents = json.decode(response.body)['data'];
        for(var item in contents){
          if(item['COD_ADR'] == id){
            OneCustomer.add(CustomerModel.fromJson(item));
          }
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

  Future getAllCustomer() async{
    try{
      customers.value.clear();
      customerList.clear();
      agemoList.clear();
      manorList.clear();
      domigList.clear();
      isLoading.value = true;
      var response = await http.get(
          Uri.parse('${urlCustomers}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      if(response.statusCode == 200){
        isLoading.value = false;
        final contents = json.decode(response.body)['data'];
        for(var item in contents){
          customers.value.add(CustomerModel.fromJson(item));
          customerList.add(CustomerModel.fromJson(item));
         // print(item['TYP_DEB']);
          if(item['TYP_DEB'] == 'A'){
            agemoList.add(CustomerModel.fromJson(item));
          }
          else if(item['TYP_DEB'] == 'G')
          {
            manorList.add(CustomerModel.fromJson(item));
          }
          else if(item['TYP_DEB'] == 'D')
          {
            domigList.add(CustomerModel.fromJson(item));
          }
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

}