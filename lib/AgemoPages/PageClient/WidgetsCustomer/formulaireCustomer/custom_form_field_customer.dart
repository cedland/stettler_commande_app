import 'package:flutter/material.dart';

import '../../../couleurs.dart';
class CustomFormFieldCustomer extends StatelessWidget {
  CustomFormFieldCustomer({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.label,
    required this.keyboard,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final String label;
  late  String valu ='';
  final TextInputType keyboard;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom: screenHeight/92.5),
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
              label: Text(label),
              labelStyle:TextStyle(fontSize: 12, fontFamily: 'LatoRegular',color: appbarColor),
              hintText: hintText,
              hintStyle:TextStyle(fontSize: 11, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            keyboardType: keyboard,
            onChanged: (value) => valu = value,
          ),
        ),
      ],
    );
  }
}
