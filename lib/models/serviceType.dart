class Servicetype {

  Servicetype({
    this.validity,
    this.expiryDate,
    this.name
  });

  String? validity;
  String? expiryDate;
  String? name;


    factory Servicetype.fromJson(Map<String, dynamic> json) => Servicetype(
        expiryDate: json["expiryDate"],
        name: json["name"],
        validity: json["validity"],
      );
}