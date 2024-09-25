import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../AgemoConstant/constants.dart';
import 'package:toastification/toastification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AgemoPages/PageAccueil/welcome_screen.dart';


class AuthentificationController extends GetxController {
  final isLoading = false.obs;
  //var token = ''.obs;
  final box = GetStorage();

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString("token").toString())["token"];
    print("la valeur du token est $token");
    return jsonDecode(localStorage.getString("token").toString())["token"];
  }

  authData(data, apiUrl) async {
    var fullUrl = urlLogin + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }
  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };

  Future login({
    required String email,
    required String password,
    required BuildContext context
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${urlLogin}login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        token = json.decode(response.body)['success']['token'];
        box.write('token', token);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', token);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('email', email);
        Get.offAll(() => WelcomeScreen());
      } else {
        isLoading.value = false;
        showtoast("Erreur!!",json.decode(response.body)['message'], Colors.red, Icons.error,ToastificationType.error,context);

      }
    } catch (e) {
      isLoading.value = false;

      print(e.toString());
    }
  }



  void showtoast(String title, String description,Color couleur, IconData icon,ToastificationType type,BuildContext context){
    toastification.show(
      context: context,
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(title),
      // you can also use RichText widget for title and description parameters
      description: RichText(text:  TextSpan(text:description)),
      alignment: Alignment.topRight,
      //direction: TextDirection.,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(icon),
      primaryColor: couleur,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}

