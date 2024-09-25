import 'package:flutter/material.dart';
import '../../../AgemoModels/customer_model.dart';
import '../../couleurs.dart';
import 'customer_settings.dart';
import 'infosRabaisScreen.dart';
import 'infosRemarkScreen.dart';
import 'infos_comptability_screen.dart';
import 'infos_general_screen.dart';
import 'infos_tourne_screen.dart';




class ProfilAllCustomer extends StatefulWidget {
  const ProfilAllCustomer({super.key, required this.customer});
  final CustomerModel customer;

  @override
  State<ProfilAllCustomer> createState() => _ProfilAllCustomerState();
}

class _ProfilAllCustomerState extends State<ProfilAllCustomer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

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
        title: const Text("Profile",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold")),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: screenHeight/60,horizontal: screenWidth/20),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight/6.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth/36,vertical: screenHeight/74),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width:screenWidth/1.5,
                              height: screenHeight/6.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: screenWidth/1.5,
                                      child: Text("${widget.customer.NOM} ${widget.customer.PRE}" ,
                                        style:TextStyle(fontSize: 16, fontFamily: 'LatoBold'),)
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(left: screenWidth/90),
                                    child: Text(
                                      widget.customer.EMAIL,
                                      style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular'),

                                    ),
                                  ),
                                  //const SizedBox(height: 20),
                                  Padding(
                                    padding:  EdgeInsets.only(left: screenWidth/90),
                                    child: Text(
                                      "phone",
                                      //customerinfo.customer_phone,
                                      style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular'),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth/1.15,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child:
                                      Padding(
                                        padding:  EdgeInsets.only(left: screenWidth/90),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "adresse",
                                            //"${customerinfo.customer_address!.isNotEmpty ? customerinfo.customer_address! : ' '} ${customerinfo.customer_street!.isNotEmpty ? customerinfo.customer_street! : ' '} ${customerinfo.customer_post_office_box ==null ? ' ':customerinfo.customer_post_office_box.toString()}",
                                            style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular'),
                                          ),
                                        ),
                                      ),
                                      ),
                                    ),

                                ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: screenHeight/30),
                Column(
                  children: [
                    CustomerSettings(
                      icon: Icons.history,
                      text: "Historique",
                      onPressed: () {
                      },
                    ),
                    CustomerSettings(
                        icon: Icons.person_2_outlined,
                        text: "Générale",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoGeneralScreen(customer: widget.customer),
                            ),
                          );
                        }),
                    CustomerSettings(
                        icon: Icons.settings,
                        text: "Comptabilité",
                        onPressed: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoComptabilityScreen(customer: widget.customer),
                            ),
                          );
                        }),
                    CustomerSettings(
                        icon: Icons.money,
                        text: "Rabais",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoRabaisScreen(customer: widget.customer),
                            ),
                          );
                        }),
                    CustomerSettings(
                        icon: Icons.local_shipping,
                        text: "Tournées",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoTourneScreen(customer: widget.customer),
                            ),
                          );
                        }),
                    CustomerSettings(
                        icon: Icons.text_snippet,
                        text: "Remarques",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoRemarkScreen(customer: widget.customer),
                            ),
                          );
                        }),
                    SizedBox(height: screenHeight/92.5,)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


