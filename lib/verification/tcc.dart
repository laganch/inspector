import 'dart:convert';

import 'package:airs_inspector/models/verificationDto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../baseUrl.dart';
import '../myApp.dart';

class Tcc extends StatefulWidget {
  const Tcc({super.key});

  @override
  State<StatefulWidget> createState() => _Tcc();
}

class _Tcc extends State<Tcc> {
  bool isloading = false;
  bool isError = false;
  var tccNo = TextEditingController();

  Verificationdto responseData = Verificationdto();
  void validation() async {
    setState(() {
      isloading = true;
    });
    var response = await BaseClient()
        .get("verification/tcc/${tccNo.text}/tcc")
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
    setState(() {
      responseData = dto;
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Verify Tcc Certificate"),
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
                "Verify TCC Certificate",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 5),
              TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(19)],
                controller: tccNo,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Center(
                    child: Text(
                      "eg TCC-23157TPF09",
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
                            Stack(
                              children: <Widget>[
                                // This widget is at the bottom
                                const SizedBox(
                                  width: double.infinity,
                                  height: 180, // Base layer background
                                ),
                                // This widget is in the middle
                                Positioned(
                                  top: 0,
                                  child: Container(
                                    width: 700,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: responseData.validity == "VALID"
                                          ? const Color.fromRGBO(3, 135, 64, 1)
                                          : const Color.fromRGBO(
                                              243, 14, 14, 1),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                    ),
                                  ),
                                ),
                                // This widget is on top (highest z-index)
                                Positioned(
                                  top: (300 - 230) /
                                      2, // Center the container vertically
                                  left: (300 - 50) / 2,
                                  // Center the container horizontally
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: responseData.photo != null
                                            ? Image.network(
                                                "${responseData.photo}",
                                                height: 140,
                                                width: 130,
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                  "assets/login.jpeg",
                                                ),
                                                height: 130,
                                                width: 130,
                                                fit: BoxFit.cover,
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 40, // Center the image vertically
                                  left: 225, // Center the image horizontally
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: responseData.validity == "VALID"
                                            ? const Image(
                                                image: AssetImage(
                                                  "assets/status.png",
                                                ),
                                                height: 150,
                                                width: 130,
                                              )
                                            : const Image(
                                                image: AssetImage(
                                                  "assets/status2.png",
                                                ),
                                                height: 150,
                                                width: 130,
                                              ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            responseData.displayName != null
                                ? Column(
                                    children: [
                                      Center(
                                        child: (Text(
                                          "${responseData.displayName}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )),
                                      ),
                                      Center(
                                        child: (Text("${responseData.email}")),
                                      ),
                                      Center(
                                        child: ( responseData.phone != null ? Text(
                                          "${responseData.phone}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ):const Text("N/A")),
                                      ),
                                    ],
                                  )
                                : const Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "INVALID TCC Number",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      )
                                    ],
                                  ),
                            responseData.id != null
                                ? const Divider(
                                    color: Colors.grey,
                                    thickness: BorderSide.strokeAlignCenter,
                                  )
                                : const Text(""),
                            responseData.id != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "TCC Number:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("${responseData.id}")
                                    ],
                                  )
                                : const Text(""),
                            responseData.id != null
                                ? const Divider(
                                    color: Colors.grey,
                                    thickness: BorderSide.strokeAlignCenter,
                                  )
                                : const Text(""),
                            responseData.id != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Source of Income:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      responseData.profession != null ? Text("${responseData.profession}"):const Text("N/A")
                                    ],
                                  )
                                : const Text(""),
                            responseData.id != null
                                ? const Divider(
                                    color: Colors.grey,
                                    thickness: BorderSide.strokeAlignCenter,
                                  )
                                : const Text(""),
                            responseData.id != null
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Expiry Date:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("31-DEC-${responseData.date}")
                                    ],
                                  )
                                : Text(""),
                          ]),
                        ),
                      )
                    : isloading
                        ? const CircularProgressIndicator()
                        : isError
                            ? const Text("Invalid TCC number")
                            : const Text("")
              ])
            ],
          ),
        )));
  }
}
