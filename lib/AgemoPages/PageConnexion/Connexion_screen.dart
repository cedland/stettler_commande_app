import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';
import '../../AgemoControllers/authentification_controller.dart';
import 'WidgetsConnexion/image_connexion.dart';
import 'WidgetsConnexion/logo_connexion.dart';



class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {

  String login = '';
  String motDePass = '';
  bool passToggle = true;
  bool isAuth = false;
//Here is our bool variable
  bool isLoginTrue = false;
  //TextEditing controller to control the text when we enter into it
  final identifier = TextEditingController();
  final password = TextEditingController();
  final AuthentificationController _authentificationController = Get.put(AuthentificationController());


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    identifier.dispose();
    password.dispose();
    super.dispose();
  }
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth/14.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight/12.33),
                      child: LogoConnexion(),
                    ),
                    SizedBox(height: screenHeight/92.5,),
                    const ImageConnexion(),
                    SizedBox(height: screenHeight/37,),
                    Text(
                      "Connexion",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'LatoBold',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: screenHeight/49.33,),
                    TextFormField(
                      controller: identifier,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Votre identifiant',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(
                              150, 124, 125, 129),
                          fontFamily: 'LatoLight',
                        ),
                        hintText: 'Entrez votre identifiant',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(
                              150, 124, 125, 129),
                          fontFamily: 'LatoLight',
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        prefixIcon: const Icon(Icons.email,color: const Color.fromARGB(150, 124, 125, 129),),
                        suffix: const InkWell(
                          onTap: null,
                          child: Icon(Icons.accessibility,color: const Color.fromARGB(150, 124, 125, 129),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: appbarColor,
                          ),
                        ),
                      ),
                      onChanged: (value) => login = value,
                    ),
                    SizedBox(height: screenHeight/37,),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(
                              150, 124, 125, 129),
                          fontFamily: 'LatoLight',
                        ),
                        hintText: 'Entrez votre mot de passe',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(
                              150, 124, 125, 129),
                          fontFamily: 'LatoLight',
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        prefixIcon: const Icon(Icons.lock,color: const Color.fromARGB(150, 124, 125, 129),),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off,color: const Color.fromARGB(150, 124, 125, 129),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: appbarColor,
                          ),
                        ),
                      ),
                      obscureText: passToggle,
                      onChanged: (value) => motDePass = value,
                    ),
                    SizedBox(
                      height: screenHeight/15,
                    ),
                    InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            //Login method will be here
                            //logins();
                            await _authentificationController.login(
                              email: identifier.text.trim(),
                              password: password.text.trim(),
                              context: context,
                              // context: context
                            );
                            //Now we have a response from our sqlite method
                            //We are going to create a user
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            height: screenHeight/14.8,
                            decoration: BoxDecoration(
                              color: appbarColor,
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Center(
                                child: const Text(
                                  'Connexion',style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "LatoBold"),
                                  textAlign: TextAlign.center,
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
