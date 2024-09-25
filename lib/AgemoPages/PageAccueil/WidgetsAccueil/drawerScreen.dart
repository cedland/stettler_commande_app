import 'package:flutter/material.dart';
import '../../PageClient/all_customer_screen.dart';
import '../../PageConnexion/Connexion_screen.dart';
import '../../PagesProduit/product_screen.dart';
import '../../couleurs.dart';
class DrawerScreen extends StatelessWidget {

  const DrawerScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    void _deconnexion(){
      showDialog(
        context: context,
        builder: (ctx) => Center(
          child: AlertDialog(
            backgroundColor: Colors.white,
            title:  Text("Voulez-vous vous déconnecter?", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',),textAlign: TextAlign.center,),
            actions: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConnexionScreen()),
                      );
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(appbarColor)),
                    child: Text("OUI", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white)),
                  ),
                   SizedBox(width: screenWidth/18,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black)),
                    child:  Text("NON", style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),),
                  ),

                ],
              ),
            ],
          ),
        ),
      );
    }
    return Container(
      width: screenWidth * 0.55,
      color: Colors.white,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth/20,vertical: screenHeight/74),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_app.png'),
                    SizedBox(height: screenHeight/61.67,),
                    SizedBox(
                      width: double.infinity,
                      child:
                      FittedBox(
                          fit: BoxFit.scaleDown ,
                          child: Text(email)),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title:  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/24),
                    child: Text('Accueil',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),

                  /*onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccueilScreen()),
                    );
                  },*/
                ),
                 SizedBox(height: screenHeight/92.5,),
                ListTile(
                  title:  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/24),
                    child: Text('Clients',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllCustomerScreen()),
                    );
                  },
                ),
                SizedBox(height: screenHeight/92.5,),
               /* ListTile(
                  title: Padding(
                    padding:  EdgeInsets.only(left: screenWidth/24),
                    child: Text('Bulletins',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BulletinScreen()),
                    );
                  },
                ),
                 SizedBox(height: screenHeight/92.5,),*/
                ListTile(
                  title:  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/24),
                    child: Text('Produits',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',),),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductScreen()),
                    );
                  },
                ),
                 SizedBox(height: screenHeight/92.5,),
                ListTile(
                  title:  Padding(
                    padding:  EdgeInsets.only(left: screenWidth/24),
                    child: Text('Commandes',style: TextStyle(fontSize: 15, fontFamily: 'LatoBold',)),
                  ),
                  onTap: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdateBulletinScreen()),
                    );*/
                  },
                ),
                 SizedBox(height: screenHeight/24.67,),
               /* Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth/15),
                  child: InkWell(
                    onTap:_deconnexion ,
                    child: Container(
                        width: double.infinity,
                        height: screenHeight/18,
                        decoration: BoxDecoration(
                          color: appbarColor,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                            child: const Text(
                              'Déconnexion',style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold"),
                              textAlign: TextAlign.center,
                            )
                        )
                    ),
                  )
                ),*/
              ],
            ),

          ],
        ),
      ),
    );
  }
}
