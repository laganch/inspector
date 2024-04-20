class SignoutModal {
  String? reason;
  String? plate;
  String? description;
  DateTime? date;
  String? image;

  SignoutModal({
    this.date,
    this.description,
    this.image,
    this.plate,
    this.reason,
  });

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "description": description,
        "date": date,
        "image": image,
        "plate": plate
      };
}
