import 'dart:convert';
// import 'dart:js_interop';

import 'package:airs_inspector/models/enforcementDto.dart';
import 'package:airs_inspector/verification/application.dart';
import 'package:airs_inspector/verification/signoutInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../baseUrl.dart';
import '../myApp.dart';

EnforcementDto responseData = EnforcementDto();
bool isLoading = false;
bool isError = false;
bool show = false;

class TCode extends StatefulWidget {
  const TCode({super.key});

  @override
  State<StatefulWidget> createState() => _Tcode();
}

class _Tcode extends State<TCode> {
  var plateNo = TextEditingController();

  void validateUser() async {
    if (plateNo.text.trim() == "") {
      setState(() {
        show = true;
      });
      return;
    }
    setState(() {
      isLoading = true;
      show = false;
    });
    var response =
        await BaseClient().get("tcode/${plateNo.text}").catchError((err) {});
    if (response == null) {
      setState(() {
        isError = true;
        isLoading = false;
        responseData = EnforcementDto();
      });
      return;
    }

    Map<String, dynamic> user = jsonDecode(response);
    EnforcementDto dto = EnforcementDto.fromJson(user);
    print(dto.reason);
    setState(() {
      responseData = dto;
      isLoading = false;
    });
  }

  // ignore: non_constant_identifier_names
  void _Signout() {
    setState(() {
      responseData = EnforcementDto();
      isLoading = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignOutInfo();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 125, 117, 8),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        onPressed: _Signout,
        icon: const Icon(Icons.sick),
        label: const Text('SIGN OUT VEHICLE'),
      ),
      appBar: AppBar(
        title: const Text("Anambra Inspector"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            setState(() {
              responseData = EnforcementDto();
              isLoading = false;
            });
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
        actions: [
          IconButton(
            onPressed: _Signout,
            icon: const Icon(Icons.wallet),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                "Enter Tcode/Ucode/Plate Number",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),LengthLimitingTextInputFormatter(14)],
                controller: plateNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Tcode/Ucode/Plate Number",
                  prefixIcon: const Icon(Icons.abc),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              show
                  ? const Text(
                      "Fill All Required Fields",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                      textAlign: TextAlign.start,
                    )
                  : const Text(""),
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
                    onPressed: isLoading ? null : validateUser,
                    child: const Text(
                      "Check Status",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  responseData.name != null && !isLoading
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: responseData.photo != null
                                          ? Image.network(
                                              "${responseData.photo}",
                                              height: 110,
                                              width: 100,
                                            )
                                          : const Image(
                                              image: AssetImage(
                                                "assets/login.jpeg",
                                              ),
                                              height: 90,
                                            ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Name:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Asset Type:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.type}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Asset Number:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.plateNumber}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Asset Code:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.asin}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Address:"),
                                        const Spacer(),
                                        Text(
                                          responseData.address != null &&
                                                  responseData.address!.length >
                                                      32
                                              ? "${responseData.address!.substring(0, 29)}"
                                                  "..."
                                              : "${responseData.address}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Route:"),
                                        const Spacer(),
                                        Text(
                                          responseData.route != null &&
                                                  responseData.route!.length >
                                                      32
                                              ? "${responseData.route!.substring(0, 29)}"
                                                  "..."
                                              : "${responseData.route}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Date Registered:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.dateRegistered}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.white),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 147, 121, 16)),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text("REGISTERED SINCE",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              // Text("Weeks",
                                              //     style: TextStyle(
                                              //       color: Theme.of(context)
                                              //           .colorScheme
                                              //           .background,
                                              //       fontWeight: FontWeight.bold,
                                              //     )),
                                              Text(
                                                "${responseData.month}",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.white),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text("Amount Due:"),
                                        const Spacer(),
                                        Text("${responseData.amountDue}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Amount Paid:"),
                                        const Spacer(),
                                        Text("${responseData.totalPayment}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Last Amount Paid:"),
                                        const Spacer(),
                                        Text(
                                            "${responseData.lastPayment?.amount}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Biometric Card Fee:"),
                                        const Spacer(),
                                        Text(
                                          "${responseData.biometricStatus}",
                                          style: TextStyle(
                                              color: responseData
                                                          .biometricStatus ==
                                                      "PAID"
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .error,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Biometric Amount Paid:"),
                                        const Spacer(),
                                        Text("${responseData.biometricLevy}")
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: BorderSide.strokeAlignCenter,
                                    ),
                                    Row(
                                      children: [
                                        const Text("Waiver Amount:"),
                                        const Spacer(),
                                        Text("${responseData.waiver}")
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
                                    const Text("STATUS"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "${responseData.status}",
                                              style: TextStyle(
                                                  color: responseData.status ==
                                                          "VALID"
                                                      ? Colors.green
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .error,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              "${responseData.reason}",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
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
                                          responseData.historyList?.length,
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
                                                    "${responseData.historyList![index].feeDescription}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleLarge),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        "${responseData.historyList?[index].amount}"),
                                                    const Spacer(),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            "${DateTime.parse("${responseData.historyList?[index].payment_date!.substring(
                                                          0,
                                                        )}")}"),
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
                      : isLoading
                          ? const CircularProgressIndicator()
                          : isError
                              ? const Text(
                                  "This Number is not Registered, pls contact AIRS for further details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                )
                              : const Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
