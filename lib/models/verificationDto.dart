class Verificationdto {
  Verificationdto(
      {this.asin,
      this.date,
      this.displayName,
      this.email,
      this.id,
      this.paymentDate,
      this.phone,
      this.photo,
      this.profession,
      this.validity});

  String? photo;
  String? validity;
  String? date;
  String? displayName;
  String? phone;
  String? email;
  String? profession;
  String? id;
  String? asin;
  String? paymentDate;

  factory Verificationdto.fromJson(Map<String, dynamic> json) =>
      Verificationdto(
        phone: json["phone"],
        photo: json["photo"],
        date: json["date"],
        displayName: json["displayName"],
        asin: json["asin"],
        id: json["id"],
        email: json["email"],
        paymentDate: json["paymentDate"],
        validity: json["validity"],
        profession: json["profession"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "photo": photo,
        "date": date,
        "displayName": displayName,
        "id": id,
        "email": email,
        "validity": validity,
        "profession": profession,
        "paymentDate": paymentDate,
        "asin": asin,
      };
}
