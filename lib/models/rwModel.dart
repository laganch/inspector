import 'package:airs_inspector/models/paymentDto.dart';
// import 'package:flutter/material.dart';

class RoadWorthinessDto {
  RoadWorthinessDto(this.amountPaid, this.payment);

  final List<PaymentDto> payment;
  final double amountPaid;
}
