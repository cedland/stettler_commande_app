import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';
import 'AgemoConstant/app_routes.dart';
import 'AgemoProvider/cart_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';


final theme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
  fontFamily: GoogleFonts.poppins().fontFamily,
  useMaterial3: true,
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return GetMaterialApp(

          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('fr'),
            Locale('en')
          ],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.generateRoute,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: appbarColor),
            primaryColor: appbarColor,
            useMaterial3: true,
          ),
          transitionDuration: const Duration(milliseconds: 500),
          themeMode: ThemeMode.system,
          initialRoute: '/',

        );
      })


    );
  }
}
