// import 'dart:convert';

class PaymentDto {
  PaymentDto(
      {this.amount,
      this.paymentReference,
      this.asin,
      this.feeDescription,
      this.name,
      this.payment_date});

  double? amount;
  String? payment_date;
  String? name;
  String? feeDescription;
  String? asin;
  String? paymentReference;

  factory PaymentDto.fromJson(Map<String, dynamic> json) => PaymentDto(
        amount: json["amount"],
        payment_date: json["payment_date"],
        asin:json["asin"],
        feeDescription: json["feeDescription"],
        paymentReference: json["paymentReference"],
        name: json["name"]
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "payment_date": payment_date,
        "name": name,
        "feeDescription": feeDescription,
        "asin": asin,
        "reference": paymentReference
      };
}
