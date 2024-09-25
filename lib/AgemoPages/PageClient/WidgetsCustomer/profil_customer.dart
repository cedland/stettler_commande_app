import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoModels/customer_model.dart';
import '../../couleurs.dart';
import 'customer_settings.dart';
import 'package:el_tooltip/el_tooltip.dart';

import 'infosRabaisScreen.dart';
import 'infosRemarkScreen.dart';
import 'infos_comptability_screen.dart';
import 'infos_general_screen.dart';
import 'infos_tourne_screen.dart';


class ProfilCustomer extends StatefulWidget {
  const ProfilCustomer({super.key, required this.customer});
  final CustomerModel customer;

  @override
  State<ProfilCustomer> createState() => _ProfilCustomerState();
}

class _ProfilCustomerState extends State<ProfilCustomer> with SingleTickerProviderStateMixin {
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
                            Padding(
                              padding:  EdgeInsets.only(left: screenWidth/45),
                              child: Container(
                                width:screenWidth/1.5,
                                height: screenHeight/6.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: screenWidth/1.5,
                                        child: Text("${widget.customer.NOM} ${widget.customer.PRE}",
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
                            ),
                            Container(
                              width: screenWidth/7,
                              height: screenHeight/6.8,
                              child: Center(
                                child: ElTooltip(
                                  content: SizedBox(
                                    width: screenWidth/2.5,
                                    height: screenHeight/12,
                                    //color: Colors.red,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(onTap:(){
                                          /* Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => FormPageUpdateCustomer(customer_id:widget.customerId.toString(),)));*/
                                        },child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.update,size: 16,color: Colors.red[700]),
                                            SizedBox(width: screenWidth/72,),
                                            Text("Mise à jour",
                                              style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular',color: Colors.black),
                                            ),
                                          ],
                                        )),
                                        GestureDetector(onTap:() {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return  Center(
                                                child: ScaleTransition(
                                                  scale: _scaleAnimation,
                                                  child: SizedBox(
                                                    height: screenHeight/3.5,
                                                    child: AlertDialog(
                                                      backgroundColor: Colors.orange.shade50,
                                                      title: Center(child: Text("Supprimer",style:TextStyle(fontSize: 16,color: Colors.black,fontFamily: "LatoRegular"))),
                                                      content: Center(child: Text("Voulez vous supprimer ce client?",style:TextStyle(fontSize: 14,color: Colors.black,fontFamily: "LatoRegular"))),
                                                      actions: <Widget>[
                                                        Padding(
                                                          padding:  EdgeInsets.symmetric(horizontal: screenWidth/30),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed: ()async{
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor: appbarColor,
                                                                  elevation: 0, //elevation of button
                                                                  shape: RoundedRectangleBorder( //to set border radius to button
                                                                      borderRadius: BorderRadius.circular(12)
                                                                  ),
                                                                ),
                                                                child: const Text('Oui',style:TextStyle(fontSize: 14,color: Colors.white,fontFamily: "LatoRegular")),
                                                              ),
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  _controller.reverse();
                                                                  Navigator.of(context).pop();
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.green,
                                                                  elevation: 0, //elevation of button
                                                                  shape: RoundedRectangleBorder( //to set border radius to button
                                                                      borderRadius: BorderRadius.circular(12)
                                                                  ),
                                                                ),
                                                                child: const Text('Non',style:TextStyle(fontSize: 14,color: Colors.white,fontFamily: "LatoRegular")),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },child:  Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.delete,size: 16,color: Colors.red[700]),
                                            SizedBox(width: screenWidth/72,),
                                            Text("Supprimer",
                                              style:TextStyle(fontSize: 12, fontFamily: 'LatoRegular',color: Colors.black),
                                            ),
                                          ],
                                        )),
                                        //GestureDetector(onTap:ontap2,child: const Icon(Icons.email,size: 16,color: Colors.grey,)),
                                      ],
                                    ),
                                  ),
                                  color: Colors.red.shade50,
                                  child: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: Colors.grey[50],
                                    child: Icon(Icons.more_horiz_outlined,color: appbarColor,size: 30,), //here
                                  ),
                                ),
                              ),

                            )
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


