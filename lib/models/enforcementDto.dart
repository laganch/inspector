// import 'dart:ffi';

import 'package:airs_inspector/models/paymentDto.dart';
import 'dart:convert';

List<EnforcementDto> userFromJson(String str) => List<EnforcementDto>.from(
    json.decode(str).map((x) => EnforcementDto.fromJson(x)));

String userToJson(List<EnforcementDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EnforcementDto {
  EnforcementDto({
    this.payment_date,
    this.penaltyBalance,
    this.address,
    this.amount,
    this.amountDue,
    this.asin,
    this.biometricLevy,
    this.biometricStatus,
    this.dateRegistered,
    this.fee_description,
    this.historyList,
    this.lastPayment,
    this.name,
    this.otherPenaltyDue,
    this.paymentBalance,
    this.paymentHistoryDto,
    this.penaltyDue,
    this.photo,
    this.plateNumber,
    this.reference,
    this.registeredDays,
    this.registeredMonth,
    this.registeredWeeks,
    this.route,
    this.status,
    this.totalPayment,
    this.totalPenalty,
    this.type,
    this.month,
    this.waiver,
    this.reason,
    this.expected
  });

  double? amount;
  String? payment_date;
  String? name;
  String? fee_description;
  String? asin;
  String? reference;
  String? plateNumber;
  String? photo;
  List<PaymentDto>? historyList;
  String? route;
  String? address;
  PaymentDto? paymentHistoryDto;
  PaymentDto? lastPayment;
  double? totalPayment;
  double? totalPenalty;
  double? paymentBalance;
  double? penaltyBalance;
  int? registeredWeeks;
  int? registeredDays;
  int? registeredMonth;
  double? amountDue;
  double? penaltyDue;
  double? otherPenaltyDue;
  String? dateRegistered;
  String? status;
  double? biometricLevy;
  String? biometricStatus;
  String? type;

  String? month;
  double? waiver;
  double? expected;
  String? reason;

  factory EnforcementDto.fromJson(Map<String, dynamic> json) => EnforcementDto(

        dateRegistered: json["dateRegistered"],
        name: json["name"],
        amount: json["amount"],
        registeredDays: json["registeredDays"],
        registeredWeeks: json["registeredWeeks"],
        amountDue: json["amountDue"],
        address: json["address"],
        totalPayment: json["totalPayment"],
        payment_date: json["payment_date"],
        fee_description: json["fee_description"],
        asin: json["asin"],
        reference: json["reference"],
        plateNumber: json["plateNumber"],
        photo: json["photo"],
        route: json["route"],
        totalPenalty: json["totalPenalty"],
        paymentBalance: json["paymentBalance"],
        penaltyBalance: json["penaltyBalance"],
        penaltyDue: json["penaltyDue"],
        otherPenaltyDue: json["otherPenaltyDue"],
        status: json["status"],
        biometricLevy: json["biometricLevy"],
        biometricStatus: json["biometricStatus"],
        type: json["type"],
        month: json["month"],
        reason: json["reason"],
        waiver: json["waiver"],
        expected: json["expected"],

        paymentHistoryDto: json["paymentHistoryDto"] != null ? PaymentDto.fromJson(json["paymentHistoryDto"]): null,
        lastPayment: json["lastPayment"] != null ? PaymentDto.fromJson(json["lastPayment"]): null,
        historyList: json["historyList"] != null
            ? List<PaymentDto>.from(
                json["historyList"].map((x) => PaymentDto.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "qualifications": historyList != null
            ? List<dynamic>.from(historyList!.map((x) => x.toJson()))
            : [],
      };
}
