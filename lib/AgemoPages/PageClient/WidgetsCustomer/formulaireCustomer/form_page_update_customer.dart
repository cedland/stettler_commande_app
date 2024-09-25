import 'package:carousel_slider/carousel_slider.dart';
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

class FormPageUpdateCustomer extends StatefulWidget {
  FormPageUpdateCustomer({Key? key, required this.customer_id}) : super(key: key);
  final String customer_id;
  @override
  _FormPageUpdateCustomerState createState() => _FormPageUpdateCustomerState();
}

class _FormPageUpdateCustomerState extends State<FormPageUpdateCustomer> {
  int currentStep = 0;
  int id_enterprise = -1;
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

  String gender ="" ;

  final List<String> items = [
    'Français',
    'Anglais',
    'Allemand',
    'Espagnol',
    'Chinois',
    'Italien'
  ];

  final List<String> items2 = [
    "",
    'Français',
    'Anglais',
    'Allemand',
    'Espagnol',
    'Chinois',
    'Italien'
  ];
   String? selectedValue;




  @override
  void initState() {
   /* _customerController.getOneCustomer(widget.customer_id).then((customer) async{
      setState(() {
       // enterprise_id:widget.customer_id,
        gender = customer.customer_civility!;
        nomClientController.text = customer.customer_name;
        prenomClientController.text = customer.customer_surname!;
        nomEntrepriseController.text = customer.customer_enterprise!;
        adresseController.text = customer.customer_address!;
        cpController.text = customer.customer_post_office_box == null? "":customer.customer_post_office_box!.toString();
        villeController.text = customer.customer_street!;
        telController.text = customer.customer_phone;
        mailController.text = customer.customer_email;
        groupeController.text = customer.customer_group_comptability!;
        conditionController.text = customer.customer_condition_paiement_comptability!;
        representantController.text = customer.customer_representant_comptability!;
        remarqueController.text = customer.customer_remark!;
        compteController.text = customer.customer_number_comptability == null? "":customer.customer_number_comptability!.toString();
        rabaisController.text = customer.customer_rabais == null? "":customer.customer_rabais!.toString();
        tourneeController.text = customer.customer_number_tourne == null? "":customer.customer_number_tourne!.toString();
        codetourneController.text = customer.customer_code_tourne == null? "":customer.customer_code_tourne!.toString();
        seqController.text = customer.customer_sequence_tourne == null? "":customer.customer_sequence_tourne!.toString();
        codeVendeurController.text = customer.customer_seller_code == null? "":customer.customer_seller_code!.toString();
        dateController.text = customer.customer_date_tourne.toString();
        selectedValue = customer.customer_language!;
        id_enterprise = customer.enterprise_id!;
      });
    });*/
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: "Mise à jour client", function: CustomAppBarFunction.back,),
        backgroundColor: Colors.grey.shade50,
        body: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: screenHeight/49.33, bottom: screenHeight/148),
              child: Center(
                child: Text(
                  "Sélectionner l'entreprise",
                  style:TextStyle(fontSize: 14, fontFamily: 'LatoBold'),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            /*Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth/20,vertical: screenHeight/74),
              child: Obx(() {
                return _homeController.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                ):_homeController.entreprises.value.isEmpty?
                const Center(child: Text("Aucune entreprise trouvée", style:TextStyle(fontSize: 16,color: Colors.red,fontFamily: "LatoRegular")))
                    : Center(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: screenHeight/7,
                      autoPlay: true
                    ),
                    itemCount: _homeController.entreprises.value.length,
                    itemBuilder: (BuildContext context, int index, int realIndex) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            id_enterprise = _homeController.entreprises.value[index].id!;
                          });
                          showtoast("Succès!!",'${_homeController.entreprises.value[index].enterprise_name} selectionné avec succès ', Colors.green, Icons.check,ToastificationType.success,context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth/120),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: screenWidth,
                              color: Color(int.parse(_homeController.entreprises.value[index].enterprise_color)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _homeController.entreprises.value[index].enterprise_name ,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'LatoBold',
                                        color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),*/
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
                                        final response = await _customerController.updateCustomer(
                                          //enterprise_id:id_enterprise.toString(),
                                          customer_civility:gender,
                                          customer_name:nomClientController.text.trim(),
                                          customer_surname:prenomClientController.text.trim(),
                                          customer_enterprise:nomEntrepriseController.text.trim(),
                                          customer_address:adresseController.text.trim(),
                                          customer_post_office_box:cpController.text.trim(),
                                          customer_street:villeController.text.trim(),
                                          customer_language:selectedValue!,
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
                                          id: int.parse(widget.customer_id),
                                          enterprise_id: id_enterprise
                                        ).then((value) async {
                                          await  _customerController.getCustomerEnterprise(enterprise_id: int.parse(widget.customer_id));
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
                                          codetourneController.clear();
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
                    items: selectedValue.toString().isNotEmpty ? items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList() :
                    items2
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),/*items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),*/
                    //value: selectedValue,
                    value: selectedValue.toString().isNotEmpty ? selectedValue : "",
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

             /*Center(
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
                    items: selectedValue!.isNotEmpty ? items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList() :
                    items2
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyle(fontSize: 13,color: appbarColor,fontFamily: "LatoRegular"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                   // value:"Français",
                    value: selectedValue!.isNotEmpty ? selectedValue : "",
                    //value: _value1 != null ? _value1 : null,
                    onChanged: ( String? value) {
                      setState(() {
                        selectedValue = value!;
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
                        Icons.language,
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
              ),*/
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
              CustomFormFieldCustomer(
                hintText: "Code de la tournée :",
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