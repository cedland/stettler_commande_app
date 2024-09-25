import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../couleurs.dart';

class ShowDialogProduits extends StatelessWidget {
  const ShowDialogProduits(this.text1, this.text2, this.text3, {super.key});

  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    String showAlert(String message,) {
      QuickAlert.show(
          context: context,
          title: 'succès',
          confirmBtnText: 'OK',
          confirmBtnColor: appbarColor,
          text: message,
          type: QuickAlertType.success);
      return message;
    }
    return Center(
      child: AlertDialog(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'PoppinsBold',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text2,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'PoppinsRegular',
              ),
            ),
            Text(
              text3,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'PoppinsRegular',
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                   // Navigator.of(context).pop();

                    showAlert('Votre produit a bien été supprimé !');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), backgroundColor: appbarColor,
                  ),
                  child: const Text('OUI',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'PoppinsRegular',
                      )),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), backgroundColor: Colors.black,
                  ),
                  child: const Text('NON',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'PoppinsRegular',
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
