import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AgemoControllers/customer_controller.dart';
import '../../AgemoModels/customer_model.dart';
import '../app_bar.dart';
import 'WidgetsCustomer/all_customers_items.dart';
import 'WidgetsCustomer/profil_all_customer.dart';
class AllCustomerScreen extends StatefulWidget {
  AllCustomerScreen({super.key});
  @override
  State<AllCustomerScreen> createState() => _AllCustomerScreenState();
}

class _AllCustomerScreenState extends State<AllCustomerScreen> {
  final TextEditingController keyword = TextEditingController();
  final CustomerController _customerController = Get.put(CustomerController());
  List<CustomerModel> customerList =Get.put(CustomerController()).customerList;
  List<CustomerModel> _foundCustomers = [];

  void _runFilterCustomer(String enteredKeyword) {
    List<CustomerModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = customerList;
    } else {
      results = customerList
          .where((user) =>
          user.NOM.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundCustomers = results;
    });
  }

  @override
  void initState() {
    _foundCustomers = customerList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:CustomAppBar(title: "LISTE DES CLIENTS", function: CustomAppBarFunction.back,),
      backgroundColor: Colors.grey.shade100,
      body:Padding(
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
                          hintText: "Entrer le nom du client",
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
                      onChanged: (value) => _runFilterCustomer(value),
                      style: const TextStyle(fontSize: 13,color: Colors.black,fontFamily: "LatoRegular")
                  ),
                ),
                SizedBox(
                  height: screenHeight/40,
                ),
                Expanded(
                  child:  _customerController.isLoading.value
                        ? const Center(
                      child: CircularProgressIndicator(),
                    ):_foundCustomers.isEmpty?
                    const Center(child: Text("Aucun client trouvé", style:TextStyle(fontSize: 16,color: Colors.red,fontFamily: "LatoRegular")))
                        :
                    SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _foundCustomers.length,
                        itemBuilder: (context, index) {
                          return AllCustomersItems(number_tourne:int.parse(_foundCustomers[index].COD_ADR), customer_name: _foundCustomers[index].NOM, date: _foundCustomers[index].EMAIL,customer_surname: _foundCustomers[index].PRE, ontap1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProfilAllCustomer(customer: _foundCustomers[index])),
                            );
                          });
                        },
                      ),
                    )
                ),
               /* Expanded(
                  child: Obx(() {
                    return _customerController.isLoading.value
                        ? const Center(
                      child: CircularProgressIndicator(),
                    ):_foundCustomers.isEmpty?
                    const Center(child: Text("Aucun client trouvé", style:TextStyle(fontSize: 16,color: Colors.red,fontFamily: "LatoRegular")))
                        :
                    SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _foundCustomers.length,
                        itemBuilder: (context, index) {
                          return AllCustomersItems(number_tourne:int.parse(_foundCustomers[index].COD_ADR), customer_name: _foundCustomers[index].NOM, date: _foundCustomers[index].EMAIL,customer_surname: _foundCustomers[index].PRE, ontap1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProfilAllCustomer(customer: _foundCustomers[index],)),
                            );
                          });
                        },
                      ),
                    );
                  }),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}
