import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../baseUrl.dart';
import '../models/invoiceDto.dart';
import '../myApp.dart';

class Validity extends StatefulWidget {
  const Validity({super.key});

  @override
  State<StatefulWidget> createState() => _Validity();
}

class _Validity extends State<Validity> {
  bool isloading = false;
  bool isError = false;
  var plateNo = TextEditingController();
  InvoiceDto responseData = InvoiceDto();
  void validation() async {
    setState(() {
      isloading = true;
    });
    var response =
        await BaseClient().get("vehicle/${plateNo.text}").catchError((err) {});
    if (response == null) {
      setState(() {
        isError = true;
        isloading = false;
        responseData = InvoiceDto();
      });
      return;
    }

    Map<String, dynamic> user = jsonDecode(response);
    InvoiceDto dto = InvoiceDto.fromJson(user);
    print(dto.plateNumber);
    setState(() {
      responseData = dto;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anambra Inspector"),
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
              const SizedBox(height: 10),
              Text(
                "Enter Plate Number",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),LengthLimitingTextInputFormatter(14)],
                controller: plateNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Plate Number",
                  prefixIcon: const Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: validation,
                    child: const Text("Search", style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  responseData.plateNumber != null && !isloading
                      ? Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Chassis Number:"),
                                        Spacer(),
                                        Text("${responseData.chassisNumber}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Engine Number:"),
                                        const Spacer(),
                                        Text("${responseData.engineNumber}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        Text("Plate Number:"),
                                        Spacer(),
                                        Text("${responseData.plateNumber}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Color:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.color}",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(color: Colors.white),
                                Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${responseData.make} " +
                                                  " ${responseData.model}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondaryContainer),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          responseData.serviceType?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${responseData.serviceType![index].name}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "${responseData.serviceType?[index].expiryDate}"),
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "${responseData.serviceType?[index].validity}",
                                                          style: TextStyle(
                                                            color: responseData
                                                                        .serviceType?[
                                                                            index]
                                                                        .validity ==
                                                                    "Expired"
                                                                ? Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .error
                                                                : Colors.green,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        IconTheme(
                                                          data: responseData
                                                                      .serviceType?[
                                                                          index]
                                                                      .validity ==
                                                                  "Expired"
                                                              ? IconThemeData(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .error,
                                                                )
                                                              : const IconThemeData(
                                                                  color: Colors
                                                                      .green),
                                                          child: Icon(responseData
                                                                      .serviceType?[
                                                                          index]
                                                                      .validity ==
                                                                  "Expired"
                                                              ? (Icons
                                                                  .cancel_outlined)
                                                              : (Icons
                                                                  .check_box)),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),
                        )
                      : isloading
                          ? const CircularProgressIndicator()
                          : isError
                              ? const Text("Invalid Plate number")
                              : const Text(
                                  "Enter Plate Number in the field above"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
