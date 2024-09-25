import 'package:flutter/material.dart';
import '../AgemoPages/PageAccueil/welcome_screen.dart';
import '../AgemoPages/PageConnexion/Connexion_screen.dart';
import 'package:get_storage/get_storage.dart';

class AppRoutes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final box = GetStorage();
    final token = box.read('token');
    switch(settings.name){
     case '/':
        return MaterialPageRoute(builder: (context) =>  token == null ? const ConnexionScreen() :  WelcomeScreen());
    }
    return MaterialPageRoute(builder: (context) =>  token == null ? const ConnexionScreen() :  WelcomeScreen());
  }
}


