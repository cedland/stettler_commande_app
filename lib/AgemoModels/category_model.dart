class CategoryModel{
  int idArtStructureInternet;
  int? idArtStructureInternetParent;
  String designationFr;
  String designationDe;
  dynamic cidYourshop;
  String typeListe;
  int positionStructure;
  int isVisible;
  List<CategoryModel>? categories;
  List<CategoryModel>? subCategories;


  CategoryModel({
    required this.idArtStructureInternet,
    required this.idArtStructureInternetParent,
    required this.designationFr,
    required this.designationDe,
    required this.cidYourshop,
    required this.typeListe,
    required this.positionStructure,
    required this.isVisible,
    this.categories,
    this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    idArtStructureInternet: json["IdArtStructureInternet"],
    idArtStructureInternetParent: json["IdArtStructureInternetParent"],
    designationFr: json["Designation_FR"],
    designationDe: json["Designation_DE"],
    cidYourshop: json["cid_yourshop"],
    typeListe: json["Type_Liste"],
    positionStructure: json["Position_Structure"],
    isVisible: json["isVisible"],
    categories: json["categories"] == null ? [] : List<CategoryModel>.from(json["categories"]!.map((x) => CategoryModel.fromJson(x))),
    subCategories: json["sub_categories"] == null ? [] : List<CategoryModel>.from(json["sub_categories"]!.map((x) => CategoryModel.fromJson(x))),
  );


  Map<String, dynamic> toJsonAdd() => {
    "IdArtStructureInternet": idArtStructureInternet,
    "IdArtStructureInternetParent": idArtStructureInternetParent,
    "Designation_FR": designationFr,
    "Designation_DE": designationDe,
    "cid_yourshop": cidYourshop,
    "Type_Liste": typeListe,
    "Position_Structure": positionStructure,
    "isVisible": isVisible,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJsonAdd())),
    "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJsonAdd())),
  };
}