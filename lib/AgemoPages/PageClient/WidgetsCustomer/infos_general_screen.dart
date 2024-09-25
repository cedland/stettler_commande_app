import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoModels/customer_model.dart';
import '../../couleurs.dart';
class InfoGeneralScreen extends StatefulWidget {
  const InfoGeneralScreen({super.key, required this.customer});
  final CustomerModel customer;

  @override
  State<InfoGeneralScreen> createState() => _InfoGeneralScreenState();
}

class _InfoGeneralScreenState extends State<InfoGeneralScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final TextEditingController nameController =TextEditingController();
  final TextEditingController civilityController =TextEditingController();

  final TextEditingController surnameController =TextEditingController();
  final TextEditingController enterprisenameController =TextEditingController();
  final TextEditingController telController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController languageController =TextEditingController();

  final TextEditingController streetController =TextEditingController();
  final TextEditingController addressController =TextEditingController();
  final TextEditingController cpController =TextEditingController();



  @override
  void initState() {
    nameController.text = widget.customer.NOM;
    surnameController.text = widget.customer.PRE;
    enterprisenameController.text = widget.customer.TYP_DEB;
    emailController.text = widget.customer.EMAIL;
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
        title: const Text("Générale",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold")),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                          "Informations générales du compte",
                          style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                        ),
                        Text(
                          "Profil du client contenant les  informations exactes.",
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
                              controller: civilityController,
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                              enabled: false,
                              decoration: InputDecoration(
                                  labelText: "Politesse",
                                  labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              //initialValue: customerinfo.customer_name,
                              controller: nameController,
                              enabled: false,
                              style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Nom Client",
                                  labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              controller: surnameController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Prénom",
                                  labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              controller: enterprisenameController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Nom entreprise (optionnel)",
                                  labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
        
                            ),
                            TextFormField(
                              controller: telController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Numéro de téléphone",
                                  labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              controller: emailController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
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
                  Container(
                    width: double.infinity,
                    //margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight/74,),
                        Text(
                          "Adresse",
                          style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                        ),
                        Text(
                          "Adresse qui sera mentionnée sur les factures.",
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
                              controller: addressController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Adresse",
                                  labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              controller: streetController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Ville",
                                  labelStyle: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                              ),
                            ),
                            TextFormField(
                              controller: cpController,
                              enabled: false,
                              style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Code postal",
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
      ),
    );
  }
}


