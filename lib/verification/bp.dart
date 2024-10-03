import 'dart:convert';

import 'package:airs_inspector/models/verificationDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../baseUrl.dart';
import '../myApp.dart';

class Premises extends StatefulWidget {
  const Premises({super.key});

  @override
  State<StatefulWidget> createState() => _Premises();
}

class _Premises extends State<Premises> {
  bool isloading = false;
  bool isError = false;
  var tccNo = TextEditingController();

  Verificationdto responseData = Verificationdto();
  void validation() async {
    setState(() {
      isloading = true;
    });
    var response = await BaseClient()
        .get("verification/tcc/${tccNo.text}/integrated")
        .catchError((err) {});
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
    if (dto.displayName == null) {
      setState(() {
        isError = true;
        isloading = false;
        responseData = Verificationdto();
      });
      return;
    }
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
          title: const Text("Verify  Business Premises Certificate"),
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
                "Verify  Business Premises Certificate",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                controller: tccNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Center(
                    child: Text(
                      "Enter certificate no.",
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
                responseData.displayName != null && !isloading
                    ? Container(
                        padding: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                5.0,
                                7.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(children: [
                            responseData.validity == "VALID"
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(3, 135, 64, 1),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      child: Text(
                                        "Business Premises Certificate Details",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(243, 14, 14, 1),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: const Center(
                                      child: Text(
                                        "Business Premises Certificate Details",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                            Divider(
                              height: 30,
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Owner Name: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${responseData.displayName}")
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: BorderSide.strokeAlignCenter,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                responseData.validity == "VALID"
                                    ? const Text(
                                        "Expiry Date: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,color: Color.fromRGBO(3, 135, 64, 1)
                                        ),
                                      )
                                    : const Text(
                                        "Expiry Date: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                responseData.validity == "VALID"
                                    ? responseData.paymentDate != null
                                        ? Text("${responseData.paymentDate}", style: const TextStyle(color: Color.fromRGBO(3, 135, 64, 1)),)
                                        : const Text("N/A")
                                    : responseData.paymentDate != null
                                        ? Text(
                                            "${responseData.paymentDate}",
                                            style: const TextStyle(
                                                color: Colors.red),
                                          )
                                        : const Text("N/A")
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: BorderSide.strokeAlignCenter,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Certificate Number: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                responseData.id != null
                                    ? Text("${responseData.id}")
                                    : const Text("N/A")
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: BorderSide.strokeAlignCenter,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Amount paid for: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Fire Service: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                responseData.amount != null
                                    ? Text( NumberFormat.currency(symbol: '\₦')
                                            .format(responseData.amount),style:const TextStyle(fontSize: 15, color: Color.fromRGBO(3, 135, 64, 1)))
                                    : const Text("N/A")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Business Premises: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                responseData.amount2 != null
                                    ? Text( NumberFormat.currency(symbol: '\₦')
                                            .format(responseData.amount2),style:const TextStyle(fontSize: 15, color: Color.fromRGBO(3, 135, 64, 1)),)
                                    : const Text("N/A")
                              ],
                            ),
                          ]),
                        ),
                      )
                    : isloading
                        ? const CircularProgressIndicator()
                        : isError
                            ? const Text("Invalid Certificate Number")
                            : const Text("")
              ])
            ],
          ),
        )));
  }
}
