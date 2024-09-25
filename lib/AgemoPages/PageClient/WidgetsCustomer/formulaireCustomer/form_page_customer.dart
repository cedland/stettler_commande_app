import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:toastification/toastification.dart';
import '../../../app_bar.dart';
import '../../../couleurs.dart';
import 'custom_form_field_customer.dart';
import 'custom_form_field_email_customer.dart';
import 'custom_form_field_required_customer.dart';
import 'package:intl/intl.dart';

class FormPageCustomer extends StatefulWidget {
  const FormPageCustomer({Key? key, required this.enterprise_id}) : super(key: key);
  final String enterprise_id;

  @override
  _FormPageCustomerState createState() => _FormPageCustomerState();
}

class _FormPageCustomerState extends State<FormPageCustomer> {
  int currentStep = 0;
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController civiliteController =TextEditingController();
  final TextEditingController nomClientController =TextEditingController();
  final TextEditingController prenomClientController =TextEditingController();
  final TextEditingController nomEntrepriseController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController langueController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  final TextEditingController compteController = TextEditingController();
  final TextEditingController groupeController = TextEditingController();
  final TextEditingController representantController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController rabaisController = TextEditingController();
  final TextEditingController remarqueController = TextEditingController();
  final TextEditingController tourneeController = TextEditingController();
  final TextEditingController codetourneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController seqController = TextEditingController();
  final TextEditingController codeVendeurController = TextEditingController();

 // final TextEditingController tourneCode = TextEditingController();

  final List<String> items = [
    'Français',
    'Anglais',
    'Allemand',
    'Espagnol',
    'Chinois',
    'Italien'
  ];
  String? selectedValue;

  String gender ="" ;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: "Création client", function: CustomAppBarFunction.back,),
        backgroundColor: Colors.grey.shade50,
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: screenHeight/49.33, bottom: screenHeight/148),
              child: Center(
                child: Text(
                  "Nouveau client",
                  style:TextStyle(fontSize: 20, fontFamily: 'LatoRegular'),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal:screenWidth/60),
                  child: Theme(
                    data: ThemeData(
                      canvasColor: Colors.grey[100],
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                        primary: appbarColor,
                        background: Colors.red,
                        secondary: Colors.green,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Stepper(
                        type: StepperType.vertical,
                        controlsBuilder: (context, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight/74),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor:Colors.green,
                                      elevation: 0

                                  ),
                                  onPressed: () async {
                                    bool isLastStep =
                                    (currentStep == getSteps().length - 1);
                                    if (isLastStep) {
                                      //Navigator.pop(context);
                                      //showAlert('Le client a été créé !');

                                     /* if (nomClientController.text.isNotEmpty && mailController.text.isNotEmpty && telController.text.isNotEmpty && tourneeController.text.isNotEmpty && dateController.text.isNotEmpty) {
                                        final response = await _customerController.createCustomer(
                                          enterprise_id:widget.enterprise_id,
                                          customer_civility:gender,
                                          customer_name:nomClientController.text.trim(),
                                          customer_surname:prenomClientController.text.trim(),
                                          customer_enterprise:nomEntrepriseController.text.trim(),
                                          customer_address:adresseController.text.trim(),
                                          customer_post_office_box:cpController.text.trim(),
                                          customer_street:villeController.text.trim(),
                                          customer_language:selectedValue == null? "":selectedValue!,
                                          customer_email:mailController.text.trim(),
                                          customer_phone:telController.text.trim(),
                                          customer_number_comptability:compteController.text.trim(),
                                          customer_group_comptability:groupeController.text.trim(),
                                          customer_condition_paiement_comptability:conditionController.text.trim(),
                                          customer_representant_comptability:representantController.text.trim(),
                                          customer_rabais:rabaisController.text.trim(),
                                          customer_number_tourne:tourneeController.text.trim(),
                                          customer_code_tourne:codetourneController.text.trim(),
                                          customer_date_tourne:dateController.text.trim(),
                                          customer_sequence_tourne:seqController.text.trim(),
                                          customer_seller_code:codeVendeurController.text.trim(),
                                          customer_remark:remarqueController.text.trim(),
                                          context:context,
                                        ).then((value) async {
                                          await  _customerController.getCustomerEnterprise(enterprise_id: int.parse(widget.enterprise_id));
                                        });
                                        if(response == "success"){
                                          gender ="";
                                          nomClientController.clear();
                                          prenomClientController.clear();
                                          nomEntrepriseController.clear();
                                          adresseController.clear();
                                          cpController.clear();
                                          villeController.clear();
                                          telController.clear();
                                          mailController.clear();
                                          mailController.clear();
                                          compteController.clear();
                                          groupeController.clear();
                                          conditionController.clear();
                                          representantController.clear();
                                          rabaisController.clear();
                                          tourneeController.clear();
                                          dateController.clear();
                                          seqController.clear();
                                          codeVendeurController.clear();
                                          remarqueController.clear();
                                        }
                                      }else {
                                        showtoast("Erreur!!","Veuillez remplir les champs requis", Colors.red, Icons.error,ToastificationType.error,context);
                                      }*/
                                    }else {
                                      setState(() {
                                        currentStep += 1;
                                      });
                                    }
                                  },
                                  child: const Text(
                                      'Continuer',
                                      style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: "LatoRegular")
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: screenHeight/74),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      backgroundColor: appbarColor,
                                      elevation: 0

                                  ),
                                  onPressed: () => currentStep == 0
                                      ? null
                                      : setState(() {
                                    currentStep -= 1;
                                  }),
                                  child: const Text(
                                      'Annuler',
                                      style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: "LatoRegular")
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        elevation: 0,
                        currentStep: currentStep,
                        onStepTapped: (step) => setState(() {
                          currentStep = step;
                        }),
                        steps: getSteps(),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      );
  }

  List<Step> getSteps() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text(
          "Information générale ",
          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
        ),
        content: Form(
          child: Column(
            children: [
              Container(
                height: screenHeight/12.33,
                width: screenWidth,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(150, 124, 125, 129),
                    ),

                    borderRadius: BorderRadius.circular(8)
                ),
                // width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth/36),
                      child: Text("Civilité :",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: appbarColor,),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio(value: "Mme", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value.toString();
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mme",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: "Mr", groupValue: gender, onChanged: (value){
                              setState(() {
                                gender = value.toString();
                              });
                            },fillColor:
                            MaterialStateColor.resolveWith((states) => Colors.red),),
                            Text("Mr",style: TextStyle(fontSize: 15, fontFamily: 'LatoRegular'))
                          ],
                        )

                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: screenHeight/123.33),
              CustomFormFieldRequiredCustomer(
                hintText: "Nom :",
                controller: nomClientController,
                label: "nom client",
                messag: "le nom du client",
                keyboard: TextInputType.text,
              ),
              CustomFormFieldCustomer(
                hintText: "Prénom :",
                controller: prenomClientController,
                label: "Prénom client",
                keyboard: TextInputType.text,
              ),

              CustomFormFieldCustomer(
                hintText: "Entreprise :",
                controller: nomEntrepriseController,
                label: "Nom entreprise",
                keyboard: TextInputType.text,
              ),
              CustomFormFieldCustomer(
                hintText: "Adresse :",
                controller: adresseController,
                label: "Adresse",
                keyboard: TextInputType.text,
              ),
              CustomFormFieldCustomer(
                  hintText: "Code postal :",
                  controller: cpController,
                  label: "Code postal",
                keyboard: TextInputType.number,),
              CustomFormFieldCustomer(
                  hintText: "Ville :",
                  controller: villeController,
                  label: "Ville",
                keyboard: TextInputType.text,),
              IntlPhoneField(
                controller: telController,
                initialCountryCode:"CH",
                //cursorColor: Colors.red[700],
                style: TextStyle(fontSize: 12,color: appbarColor,fontFamily: "LatoRegular"),
                dropdownTextStyle: TextStyle(fontSize: 12,color: appbarColor,fontFamily: "LatoRegular"),
                decoration:  InputDecoration(
                  labelText: 'Numéro téléphone du client',
                  labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: "LatoRegular",
                      color: appbarColor
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                languageCode: "fr",
                onChanged: (phone) {
                  //print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  //print('Country changed to: ' + country.name);
                },
              ),
              CustomFormFieldEmailCustomer(
                hintText: "Email :",
                controller: mailController,
                label: " Email  ",
                messag: "l'adresse email et invalide",
                keyboard: TextInputType.emailAddress,),
              Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint:  Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: appbarColor
                        ),
                        SizedBox(
                          width: screenWidth/90,
                        ),
                        Expanded(
                          child: Text(
                            ' Sélectionner votre langue',
                            style: TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: screenHeight/14.8,
                      width: screenWidth,
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth/51.43),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.grey.shade50,
                      ),
                      elevation: 0,
                    ),
                    iconStyleData:  IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: appbarColor,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: screenHeight/3.7,
                      width: screenWidth/1.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.red.shade50,
                      ),
                      offset: const Offset(30, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData:  MenuItemStyleData(
                      height: screenHeight/18.5,
                      padding: EdgeInsets.only(left: screenWidth/5),
                    ),
                  ),
                ),
              ),


             /* height: 60,
              width: 360,*/
              /*MultiSelectDialogField(
                dialogHeight:screenHeight/2.5,
                dialogWidth: screenWidth,
                confirmText:Text("Ajouter",style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular',color: Colors.white),),
                cancelText:Text("Annuler",style: TextStyle(fontSize: 13, fontFamily: 'LatoRegular',color: Colors.white),),
                itemsTextStyle:TextStyle(fontSize: 13, fontFamily: 'LatoRegular',color: Colors.white),
                backgroundColor:Colors.red.shade400,
                items: _items,
                title: Text("Choisissez vos langues",style: TextStyle(fontSize: 14, fontFamily: 'LatoBold',color: Colors.white),),
                selectedColor: Colors.red.shade400,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(150, 124, 125, 129),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                buttonIcon: Icon(
                  Icons.language,
                  color: appbarColor,
                ),
                buttonText: Text(
                  "Langues",
                  style: TextStyle(fontSize: 12, fontFamily: 'LatoRegular',color: appbarColor)
                ),
                onConfirm: (results) {
                  setState(() {
                    _selectedLanguage = results;
                    _itemsSelect =_selectedLanguage
                        .map((language)=>(language.language))
                        .toList();
                    langues = _itemsSelect.toString().replaceAll('[', '').replaceAll(']','');
                  });
                },
                /*onSaved:(results) {
                  setState(() {
                    _selectedLanguage = results;
                  });
                  print("${_selectedLanguage[0].language}");
                },*/
              ),*/
              //SizedBox(height: screenHeight/74,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text(
          "Comptabilité ",
          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
        ),
        content: Form(
          child: Column(
            children: [
              CustomFormFieldCustomer(
                  hintText: "nº compte collectif :",
                  controller: compteController,
                  label: "nº compte collectif ",
                keyboard: TextInputType.number,),
              CustomFormFieldCustomer(
                  hintText: "Groupe :",
                  controller: groupeController,
                  label: "Groupe ",
                keyboard: TextInputType.text,),
              CustomFormFieldCustomer(
                  hintText: "Condition de paiement :",
                  controller: conditionController,
                  label: "Condition paiement",
                keyboard: TextInputType.text,),
              CustomFormFieldCustomer(
                  hintText: "Représentant :",
                  controller: representantController,
                  label: "Représentant",
                keyboard: TextInputType.text,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text(
          "Rabais",
          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
        ),
        content: Form(
          child: Column(
            children: [
              CustomFormFieldCustomer(
                hintText: "Rabais :",
                controller: rabaisController,
                label: "Rabais",
                keyboard: TextInputType.number,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: Text(
          "Tournée",
          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
        ),
        content: Form(
          child: Column(
            children: [
              CustomFormFieldRequiredCustomer(
                hintText: "nº de la tournée :",
                controller: tourneeController,
                label: "nº de la tournée",
                messag: "le nº de la tournée",
                keyboard: TextInputType.number,),
              /*CustomFormFieldCustomer(
                hintText: "Code de la tournée :",
                controller: codetourneeController,
                label: "Code tournée",
                keyboard: TextInputType.number,),*/
              CustomFormFieldCustomer(
                hintText: "ode de la tournée :",
                controller: codetourneController,
                label: "Code tournée",
                keyboard: TextInputType.number,),
              Padding(
                padding:  EdgeInsets.only(bottom: screenHeight/74),
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: "Choisissez la date",
                    hintStyle:TextStyle(fontSize: 15, fontFamily: 'LatoRegular',color: const Color.fromARGB(150, 124, 125, 129),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 229, 36, 36),
                      ),
                    ),
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Sélectionnez une date';
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      //locale: const Locale("fr", "FR"),
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: appbarColor, // <-- SEE HERE
                              onPrimary: Colors.white, // <-- SEE HERE
                              onSurface: Colors.grey, // <-- SEE HERE
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: appbarColor, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(() {
                        dateController.text = formattedDate;
                      });
                    }
                  },
                ),
              ),
              CustomFormFieldCustomer(
                hintText: "Séquence de la tournée :",
                controller: seqController,
                label: "Séquence tournée",
                keyboard: TextInputType.number,),
              CustomFormFieldCustomer(
                hintText: "Code du vendeur :",
                controller: codeVendeurController,
                label: "Code vendeur",
                keyboard: TextInputType.number,),
            ],
          ),
        ),
      ),
      Step(
        state: currentStep > 4 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 4,
        title: Text(
          "Remarque",
          style:TextStyle(fontSize: 14, fontFamily: 'LatoRegular'),
        ),
        content: Form(
          child: Column(
            children: [
              CustomFormFieldCustomer(
                hintText: "Remarque :",
                controller: remarqueController,
                label: "Remarque",
                keyboard: TextInputType.text,),
            ],
          ),
        ),
      ),
    ];
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

class Language {
  final String language;

  Language({
    required this.language,
  });
}

