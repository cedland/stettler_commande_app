class CustomersModels{
  int? id;
  int? enterprise_id;
  String? customer_civility;
  String customer_name;
  String? customer_surname;
  String? customer_enterprise;
  String? customer_address;
  int? customer_post_office_box;
  String? customer_street;
  String? customer_language;
  String customer_email;
  String customer_phone;
  int? customer_number_comptability;
  String? customer_group_comptability;
  String? customer_condition_paiement_comptability;
  String? customer_representant_comptability;
  int? customer_rabais;
  int? customer_number_tourne;
  int? customer_code_tourne;
  String customer_date_tourne;
  int? customer_sequence_tourne;
  int? customer_seller_code;
  String? customer_remark;


  CustomersModels({ this.id,  this.enterprise_id,this.customer_civility, required this.customer_name, this.customer_surname,
    this.customer_enterprise, this.customer_address, this.customer_post_office_box, this.customer_street, this.customer_language,required this.customer_email,
    required this.customer_phone,this.customer_number_comptability,this.customer_group_comptability,this.customer_condition_paiement_comptability,
    this.customer_representant_comptability, this.customer_rabais, required this.customer_number_tourne,this.customer_code_tourne,
  required this.customer_date_tourne,this.customer_sequence_tourne,this.customer_seller_code,this.customer_remark});




  factory CustomersModels.fromJson(Map<String, dynamic> json){
    return CustomersModels(
      id:json['id'],
      enterprise_id:json['enterprise_id'],
      customer_civility:json['customer_civility']?? "",
      customer_name:json['customer_name'],
      customer_surname:json['customer_surname']?? "",
      customer_enterprise:json['customer_enterprise']?? "",
      customer_address:json['customer_address']?? "",
      customer_post_office_box:json['customer_post_office_box'],
      customer_street:json['customer_street']?? "",
      customer_language:json['customer_language']?? "",
      customer_email:json['customer_email'],
      customer_phone:json['customer_phone'],
      customer_number_comptability:json['customer_number_comptability'],
      customer_group_comptability:json['customer_group_comptability']??"",
      customer_condition_paiement_comptability:json['customer_condition_paiement_comptability']?? "",
      customer_representant_comptability:json['customer_representant_comptability']?? "",
      customer_rabais:json['customer_rabais'],
      customer_number_tourne:json['customer_number_tourne'],
      customer_code_tourne:json['customer_code_tourne'],
      customer_date_tourne:json['customer_date_tourne'],
      customer_sequence_tourne:json['customer_sequence_tourne'],
      customer_seller_code:json['customer_seller_code'],
      customer_remark:json['customer_remark']?? "",
    );
  }
  Map<String, dynamic>toJsonAdd(){
    return {
      'enterprise_id':enterprise_id,
      'customer_civility':customer_civility,
      'customer_name':customer_name,
      'customer_surname':customer_surname,
      'customer_enterprise':customer_enterprise,
      'customer_address':customer_address,
      'customer_post_office_box':customer_post_office_box,
      'customer_street':customer_street,
      'customer_language':customer_language,
      'customer_email':customer_email,
      'customer_phone':customer_phone,
      'customer_number_comptability':customer_number_comptability,
      'customer_group_comptability':customer_group_comptability,
      'customer_condition_paiement_comptability':customer_condition_paiement_comptability,
      'customer_representant_comptability':customer_representant_comptability,
      'customer_rabais':customer_rabais,
      'customer_number_tourne':customer_number_tourne,
      'customer_code_tourne':customer_code_tourne,
      'customer_date_tourne':customer_date_tourne,
      'customer_sequence_tourne':customer_sequence_tourne,
      'customer_seller_code':customer_seller_code,
      'customer_remark':customer_remark,
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      'id':id,
      'enterprise_id':enterprise_id,
      'customer_civility':customer_civility,
      'customer_name':customer_name,
      'customer_surname':customer_surname,
      'customer_enterprise':customer_enterprise,
      'customer_address':customer_address,
      'customer_post_office_box':customer_post_office_box,
      'customer_street':customer_street,
      'customer_language':customer_language,
      'customer_email':customer_email,
      'customer_phone':customer_phone,
      'customer_number_comptability':customer_number_comptability,
      'customer_group_comptability':customer_group_comptability,
      'customer_condition_paiement_comptability':customer_condition_paiement_comptability,
      'customer_representant_comptability':customer_representant_comptability,
      'customer_rabais':customer_rabais,
      'customer_number_tourne':customer_number_tourne,
      'customer_code_tourne':customer_code_tourne,
      'customer_date_tourne':customer_date_tourne,
      'customer_sequence_tourne':customer_sequence_tourne,
      'customer_seller_code':customer_seller_code,
      'customer_remark':customer_remark,
    };
  }

}