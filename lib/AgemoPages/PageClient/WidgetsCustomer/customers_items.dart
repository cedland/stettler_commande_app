import 'package:flutter/material.dart';
import 'package:stettler_livraison/AgemoPages/couleurs.dart';


class CustomersItems extends StatelessWidget {
  const CustomersItems({super.key, required this.number_tourne, required this.customer_name, this.customer_surname , required this.date, required this.ontap1, required this.ontap2});
  final int number_tourne;
  final String customer_name;
  final String? customer_surname;
  final String? date;
  final void Function() ontap1;
  final void Function() ontap2;


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ontap1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        margin:  EdgeInsets.symmetric(vertical: screenHeight/185),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: screenWidth/7.2,
              height: screenHeight/14.8,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Icon(
                Icons.check_circle_rounded,
                color: appbarColor,
                size: 30,
              ),
            ),

             SizedBox(width: screenWidth/30),
            Container(
              width: screenWidth/1.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number_tourne.toString(),
                    style:TextStyle(fontSize: 15, fontFamily: 'LatoBold'),
                  ),
                  Container(
                    width: screenWidth/1.85,
                    child: Text(
                      "$customer_name $customer_surname | $date",
                      style:TextStyle(fontSize: 11, fontFamily: 'LatoRegular'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,

                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: screenWidth/50),
            Container(
              width: screenWidth/11,
              child:  GestureDetector(
                onTap: ontap2,
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: appbarColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
