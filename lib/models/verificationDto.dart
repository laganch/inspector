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
      this.desc,
      this.channel,
      this.amount,
      this.amount2,
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
  double? amount;
  double? amount2;
  String? desc;
  String? channel;

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
        desc: json["desc"],
        channel: json["channel"],
        amount: json["amount"],
        amount2: json["amount2"],
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
        "desc": desc,
        "channel": channel,
        "amount": amount,
        "amount2": amount2,
      };
}
