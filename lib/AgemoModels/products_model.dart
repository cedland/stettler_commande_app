class ProductsModels{
  int? id;
  int? category_id;
  String product_name;
  int? product_reference;
  int? product_quantity;
  double? product_price;
  String product_image_url;
  String? product_information;
  String? product_ingredients;


  ProductsModels({ this.id,  this.category_id,required this.product_name, this.product_reference, this.product_quantity, this.product_price, required this.product_image_url, this.product_information, this.product_ingredients,});


  factory ProductsModels.fromJson(Map<String, dynamic> json){
    return ProductsModels(
      id:json['id'],
      category_id:json['category_id'],
      product_name:json['product_name'],
      product_reference:json['product_reference'],
      product_quantity:json['product_quantity'],
      product_price:json['product_price'],
      product_image_url:json['product_image_url'],
      product_information:json['product_information']?? "",
      product_ingredients:json['product_ingredients']?? "",
    );
  }
  Map<String, dynamic>toJsonAdd(){
    return {
      'category_id':category_id,
      'product_name':product_name,
      'product_reference':product_reference,
      'product_quantity':product_quantity,
      'product_price':product_price,
      'product_image_url':product_image_url,
      'product_information':product_information,
      'product_ingredients':product_ingredients,
    };
  }
  Map<String, dynamic> toJsonUpdate(){
    return{
      'id':id,
      'category_id':category_id,
      'product_name':product_name,
      'product_reference':product_reference,
      'product_quantity':product_quantity,
      'product_price':product_price,
      'product_image_url':product_image_url,
      'product_information':product_information,
      'product_ingredients':product_ingredients,
    };
  }

}