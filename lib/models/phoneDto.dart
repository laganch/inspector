class PhoneDto {
  PhoneDto(
      {this.tin_number,
      this.plate_number,
      this.display_name,
      this.email,
      this.address,
      this.message,
      this.phone_number,
      this.image,
      this.type,
      this.desc,
      this.code,});

  String? image;
  String? plate_number;
  String? display_name;
  String? phone_number;
  String? email;
  String? type;
  String? address;
  String? tin_number;
  String? message;
  String? desc;
  String? code;

  factory PhoneDto.fromJson(Map<String, dynamic> json) =>
      PhoneDto(
        phone_number: json["phone_number"],
        image: json["image"],
        plate_number: json["plate_number"],
        display_name: json["display_name"],
        tin_number: json["tin_number"],
        address: json["address"],
        email: json["email"],
        message: json["message"],
        type: json["type"],
        desc: json["desc"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone_number": phone_number,
        "image": image,
        "plate_number": plate_number,
        "display_name": display_name,
        "address": address,
        "email": email,
        "type": type,
        "message": message,
        "tin_number": tin_number,
        "desc": desc,
        "code": code,
      };
}
