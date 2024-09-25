import 'package:flutter/material.dart';
import '../../../AgemoModels/customer_model.dart';
import '../../couleurs.dart';



class InfoComptabilityScreen extends StatefulWidget {
  const InfoComptabilityScreen({super.key, required this.customer});
  final CustomerModel customer;

  @override
  State<InfoComptabilityScreen> createState() => _InfoComptabilityScreenState();
}

class _InfoComptabilityScreenState extends State<InfoComptabilityScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final TextEditingController numberController =TextEditingController();
  final TextEditingController groupeController =TextEditingController();
  final TextEditingController conditionController =TextEditingController();
  final TextEditingController representantController =TextEditingController();
  final TextEditingController rabaisController =TextEditingController();
  final TextEditingController languageController =TextEditingController();
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Adjust the duration as needed
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _scaleAnimation.isDismissed;
  } //Refresh method

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appbarColor,
        elevation: 0,
        leading: GestureDetector(onTap:(){
          Navigator.pop(context);
        }, child: const Icon(Icons.arrow_back, color: Colors.white,size: 24,)),
        title: const Text("Comptabilité",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold")),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/80,horizontal: screenWidth/20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  //margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight/74,),
                      Text(
                        "Informations comptabilité",
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                      ),
                      Text(
                        "Comptabilité du client contenant les données exactes.",
                        style:TextStyle(fontSize: 13, fontFamily: 'LatoRegular'),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  margin:  EdgeInsets.symmetric(vertical: screenHeight/70),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth/36,vertical: screenHeight/74),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: numberController,
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: "N° compte colletif",
                                labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            //initialValue: customerinfo.customer_name,
                            controller: groupeController,
                            enabled: false,
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Groupe",
                                labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            controller: conditionController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Condition paiement",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            controller: representantController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Représentant",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),

                          ),
                          TextFormField(
                            controller: rabaisController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Ristourne",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            controller: languageController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Langue",
                                labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


