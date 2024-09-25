import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoModels/customer_model.dart';
import '../../couleurs.dart';



class InfoTourneScreen extends StatefulWidget {
  const InfoTourneScreen({super.key, required this.customer});
  final CustomerModel customer;

  @override
  State<InfoTourneScreen> createState() => _InfoTourneScreenState();
}

class _InfoTourneScreenState extends State<InfoTourneScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final TextEditingController numbertourneeController =TextEditingController();
  final TextEditingController codetourneeController =TextEditingController();
  final TextEditingController datetourneController =TextEditingController();
  final TextEditingController sequenceController =TextEditingController();
  final TextEditingController codevendeurController =TextEditingController();
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
        title: const Text("Tournée",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold")),
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
                        "Informations tournées",
                        style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                      ),
                      Text(
                        "Tournées du client contenant les données exactes.",
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
                            controller: numbertourneeController,
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                            enabled: false,
                            decoration: InputDecoration(
                                labelText: "Tournée",
                                labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            //initialValue: customerinfo.customer_name,
                            controller: codetourneeController,
                            enabled: false,
                            style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Code",
                                labelStyle: TextStyle(fontSize: 14, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            controller: datetourneController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Date",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),
                          ),
                          TextFormField(
                            controller: sequenceController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "SÉQUENCE",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
                            ),

                          ),
                          TextFormField(
                            controller: codevendeurController,
                            enabled: false,
                            style:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: Colors.black),
                            decoration: InputDecoration(
                                labelText: "Code vendeur",
                                labelStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),)
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


