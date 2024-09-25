import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';

import '../../AgemoControllers/customer_controller.dart';
import '../../AgemoModels/customer_model.dart';
import '../PageClient/WidgetsCustomer/custom_app_bar.dart';
import '../PageClient/customer_screen.dart';
import 'WidgetsAccueil/drawerScreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var enterpriseName = ['AGEMO', 'MANOR', 'STETTLER & DOMIG'];

  final CustomerController _customerController = Get.put(CustomerController());
  List<CustomerModel> agemoList =[];
  List<CustomerModel> domigList =[];
  List<CustomerModel> manorList =[];

  String email="";


  getEnterpriseCustomer() async{
    await _customerController.getAllCustomer().then((value) {
      setState(() {
        agemoList = _customerController.agemoList;
        domigList = _customerController.domigList;
        manorList = _customerController.manorList;
      });
    });
  }
  Future getUserEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  @override
  void initState() {
    getEnterpriseCustomer();
    getUserEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(title: "CHOIX ENTREPRISE", function: CustomAppBarFunction.drawer),
      backgroundColor: Colors.grey.shade50,
      drawer:DrawerScreen(email: email,),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/10,horizontal: screenWidth/20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sélection entreprise",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'LatoBold',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight/74,
                ),
                Text(
                  "Complétez le profil de votre client en prenant soin de l'exactitude des informations.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'LatoRegular',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight/16.44,),
                Center(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                        autoPlay: true
                    ),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  CustomerScreen(customerList: enterpriseName.indexOf(enterpriseName[index]) == 0? agemoList : enterpriseName.indexOf(enterpriseName[index]) == 1? manorList:domigList, customerController: _customerController,
                              enterpriseName: enterpriseName.indexOf(enterpriseName[index]) == 0? enterpriseName[index] : enterpriseName.indexOf(enterpriseName[index]) == 1? enterpriseName[index]:enterpriseName[index],)),
                            //MaterialPageRoute(builder: (context) =>  CustomerScreen(enterpriseId: _homeController.entreprises.value[index].id!, enterpriseName: _homeController.entreprises.value[index].enterprise_name,)),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth/120),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: screenWidth,
                             color: enterpriseName.indexOf(enterpriseName[index]) == 0 ? appbarColor : enterpriseName.indexOf(enterpriseName[index]) == 1 ?Colors.orange :Colors.brown,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    enterpriseName[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'LatoBold',
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
