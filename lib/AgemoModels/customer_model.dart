class CustomerModel{
  String COD_ADR;
  String NOM;
  String PRE;
  String NOM_Backup;
  String EMAIL;
  String STATUT;
  String TYP_DEB;
  String status;

  CustomerModel({
    required this.COD_ADR,
    required this.NOM,
    required this.PRE,
    required this.NOM_Backup,
    required this.EMAIL,
    required this.STATUT,
    required this.TYP_DEB,
    required this.status,});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    COD_ADR: json["COD_ADR"]??"",
    NOM: json["NOM"]??"",
    PRE: json["PRE"]??"",
    NOM_Backup: json["NOM_Backup"]??"",
    EMAIL: json["EMAIL"]??"",
    STATUT: json["STATUT"]??"",
    TYP_DEB: json["TYP_DEB"]??"",
    status: json["status"]??"",
  );

  Map<String, dynamic> toJson() => {
    "COD_ADR": COD_ADR,
    "NOM": NOM,
    "PRE": PRE,
    "NOM_Backup": NOM_Backup,
    "EMAIL": EMAIL,
    "STATUT": STATUT,
    "TYP_DEB": TYP_DEB,
    "status": status,
  };
}