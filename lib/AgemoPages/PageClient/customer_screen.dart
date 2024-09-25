import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../AgemoControllers/customer_controller.dart';
import '../../AgemoModels/customer_model.dart';
import '../PagesProduit/product_command_screen.dart';
import '../app_bar.dart';
import 'package:get/get.dart';
import 'WidgetsCustomer/customers_items.dart';
import 'WidgetsCustomer/profil_customer.dart';



class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key, required this.customerList, required this.customerController, required this.enterpriseName});
  final List<CustomerModel> customerList;
  final CustomerController customerController;
  final String enterpriseName ;
  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final TextEditingController keyword = TextEditingController();
   List<CustomerModel> _foundCustomers = [];
  void _runFilterCustomer(String enteredKeyword) {
    List<CustomerModel> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = widget.customerList;
    } else {
      results = widget.customerList
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

  /*void createClient(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  FormPageCustomer(enterprise_id: widget.enterpriseId.toString(),)),
    );
  }*/



  @override
  void initState() {
    setState(() {
      _foundCustomers = widget.customerList;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: CustomAppBar(title: "${ widget.enterpriseName}", function: CustomAppBarFunction.back, additionalIcon: Icons.add,additionalFunction:(){},),
      //appBar: CustomAppBar(title: "${ widget.enterpriseName}", function: CustomAppBarFunction.back, additionalIcon: Icons.add,additionalFunction:createClient,),
     // drawer: const CustomDrawer(),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/40,horizontal: screenWidth/20),
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
                  child: Obx(() {
                    return widget.customerController.isLoading.value
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
                          return CustomersItems(number_tourne: int.parse(_foundCustomers[index].COD_ADR), customer_name: _foundCustomers[index].NOM, date: _foundCustomers[index].EMAIL,customer_surname: _foundCustomers[index].PRE, ontap1: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProfilCustomer(customer: _foundCustomers[index]),
                            ));
                          }, ontap2: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductCommandScreen()),
                            );
                          },);
                        },
                      ),
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
