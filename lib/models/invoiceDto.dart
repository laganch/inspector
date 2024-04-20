// import 'dart:ffi';

import 'package:airs_inspector/models/serviceType.dart';

class InvoiceDto {
  InvoiceDto({
    this.serviceType,
    this.chassisNumber,
    this.color,
    this.engineNumber,
    this.make,
    this.model,
    this.ownerAddress,
    this.ownerName,
    this.ownerPhone,
    this.plateNumber,
    
  });

  String? plateNumber;
  String? model;
  String? color;
  String? ownerName;
  String? ownerAddress;
  String? ownerPhone;
  String? make;
  String? engineNumber;
  String? chassisNumber;
  List<Servicetype>? serviceType;


  factory InvoiceDto.fromJson(Map<String, dynamic> json) => InvoiceDto(

        plateNumber: json["plateNumber"],
        model: json["model"],
        make: json["make"],
        ownerAddress: json["ownerAddress"],
        ownerName: json["ownerName"],
        ownerPhone: json["ownerPhone"],
        engineNumber: json["engineNumber"],
        chassisNumber: json["chassisNumber"],
        color: json["color"],

        serviceType: json["serviceTypes"] != null
            ? List<Servicetype>.from(
                json["serviceTypes"].map((x) =>  Servicetype.fromJson(x)))
            : [],
      );

}
