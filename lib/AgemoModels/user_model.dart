class UserModel{
  int id;
  String? name;
  String? identifier;
  String? password;

  UserModel({required this.id, this.name,  this.identifier,this.password});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id:json['id'],
        name:json['name'],
        identifier:json['identifier'],
        password:json['password'],
    );
  }


  Map<String, dynamic>toJsonAdd(){
    return {
      'name':name,
      'identifier':identifier,
      'password':password,
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      "id":id,
      'name':name,
      'identifier':identifier,
      'password':password,
    };
  }

}