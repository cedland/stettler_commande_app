class EnterpriseModel{
  int? id;
  String enterprise_name;
  String enterprise_color;
  EnterpriseModel({ this.id, required this.enterprise_name, required this.enterprise_color});


  factory EnterpriseModel.fromJson(Map<String, dynamic> json){
    return EnterpriseModel(
      id:json['id'],
      enterprise_name:json['enterprise_name'],
      enterprise_color:json['enterprise_color'],
    );
  }


  Map<String, dynamic>toJsonAdd(){
    return {
      'enterprise_name':enterprise_name,
      'enterprise_color':enterprise_color,

    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      'id':id,
      'enterprise_name':enterprise_name,
      'enterprise_color':enterprise_color,
    };
  }

}