class NameModel{
  String? name;
  NameModel({this.name});


  factory NameModel.fromJson(Map<String, dynamic> json){
    return NameModel(
      name:json['name'],
    );
  }


  Map<String, dynamic>toJsonAdd(){
    return {
      'name':name,
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      'name':name,
    };
  }

}