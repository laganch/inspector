import 'dart:convert';

import 'package:airs_inspector/models/verificationDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../baseUrl.dart';
import '../myApp.dart';

class PaymentVerify extends StatefulWidget {
  const PaymentVerify({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentVerify();
}

class _PaymentVerify extends State<PaymentVerify> {
  bool isloading = false;
  bool isError = false;
  var tccNo = TextEditingController();

  Verificationdto responseData = Verificationdto();
  void validation() async {
    setState(() {
      isloading = true;
    });
    var response =
        await BaseClient().get("worthiness/${tccNo.text}").catchError((err) {});
    if (response == null) {
      setState(() {
        isError = true;
        isloading = false;
        responseData = Verificationdto();
      });
      return;
    }

    Map<String, dynamic> user = jsonDecode(response);
    Verificationdto dto = Verificationdto.fromJson(user);
    print(dto.id);
    setState(() {
      responseData = dto;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verify Payment"),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainApp();
                  },
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Form(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Verify Payment",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                  LengthLimitingTextInputFormatter(9)
                ],
                controller: tccNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Center(
                    child: Text(
                      "Enter Payment Reference",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: validation,
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ])
            ],
          ),
        )));
  }
}
