import 'package:flutter/material.dart';

import '../../../couleurs.dart';

class CustomFormFieldEmailCustomer extends StatelessWidget {
  CustomFormFieldEmailCustomer({
    super.key,
    required this.hintText,
    required this.controller,
    required this.label,
    required this.messag,
    required this.keyboard
  });
  final String hintText;
  final TextEditingController controller;
  final String label;
  late  String valu ='';
  final String messag;
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: screenHeight/92.5),
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: "LatoRegular"),
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                  fontSize: 12,
                  fontFamily: "LatoRegular",
                  color: appbarColor
              ),
              hintText: hintText,
              hintStyle:  const TextStyle(
                  fontSize: 11,
                  fontFamily: "LatoRegular",
                  color: Colors.grey
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            keyboardType: keyboard,
            validator: (value) {
              if(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!)){
                return null;
              }
              return messag;
            },
            onChanged: (value) => valu = value,
          ),
        ),
      ],
    );
  }
}
