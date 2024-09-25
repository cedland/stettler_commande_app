class CategoriesModel{
  int? id;
  String category_name;
  CategoriesModel({ this.id, required this.category_name});


  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
      id:json['id'],
      category_name:json['category_name'],
    );
  }


  Map<String, dynamic>toJsonAdd(){
    return {
      'category_name':category_name,

    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      'id':id,
      'category_name':category_name,
    };
  }

}