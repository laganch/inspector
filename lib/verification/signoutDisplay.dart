import 'dart:convert';
import 'dart:io';

import 'package:airs_inspector/baseUrl.dart';
import 'package:airs_inspector/models/phoneDto.dart';
import 'package:airs_inspector/models/signoutModel.dart';
import 'package:airs_inspector/verification/application.dart';
import 'package:airs_inspector/verification/tcode.dart';
import 'package:airs_inspector/verification/tcodeDashboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

bool isLoading = false;
var plateNumber = '';

class SignoutDisplay extends StatefulWidget {
  const SignoutDisplay({super.key});

  @override
  State<StatefulWidget> createState() => _SignoutDisplay();
}

class _SignoutDisplay extends State<SignoutDisplay> {
  final plateNo = TextEditingController();
  final desc = TextEditingController();
  final reason = TextEditingController();
  Reasons _pickedReason = Reasons.sick;
  DateTime? _pickedDate;
  File? _image;
  bool isChecked = false;
  String convertIntoBase64(File file) {
    List<int> imageBytes = file.readAsBytesSync();
    String base64File = base64Encode(imageBytes);
    return base64File;
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => _image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _chooseCalender() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day - 7);
    final lastDate = DateTime(now.year, now.month, now.day + 7);
    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _pickedDate = date;
    });
  }

  void signOut() async {
    if (desc.text.trim().isEmpty || _pickedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            "Error Message",
            style: TextStyle(fontSize: 14, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          content: const Text(
            "Please be sure to fill all required fields",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Close"))
          ],
        ),
      );
      return;
    }
    setState(() {
      isLoading = true;
    });

    SignoutModal modal = SignoutModal(
        date: _pickedDate,
        description: desc.text,
        plate: plateNo.text,
        image: "",
        reason: _pickedReason.name);

    var response = await BaseClient().post("apply/signout", {
      "date": _pickedDate.toString(),
      "description": desc.text,
      "plate": plateNumber,
      "image": _image != null ? convertIntoBase64(_image!) : "",
      "auto": isChecked,
      "reason": _pickedReason.name
    });

    if (response == 'Successful') {
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, "/success");
      setState(() {
        isLoading = false;
      });
      return;
    } else {
      showDialogMessage("Error Message", "$response", Colors.red);
      setState(() {
        isLoading = false;
      });
      return;
    }
  }

  void showDialogMessage(String header, String body, Color colors) {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          header,
          style: TextStyle(fontSize: 14, color: colors),
          textAlign: TextAlign.center,
        ),
        content: Text(
          body,
          style: const TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                // CloseModal();
              },
              child: const Text("Close"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PhoneDto phoneDto =
        ModalRoute.of(context)!.settings.arguments as PhoneDto;
    plateNumber = phoneDto.tin_number!;

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
                  return MyDashboard();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white24, // Background color
                  border: Border.all(
                    color: Colors.white38, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius:
                      BorderRadius.circular(12.0), // Optional: Rounded corners
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: phoneDto.image != null
                              ? Image.network(
                                  "${phoneDto.image}",
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
                              "${phoneDto.display_name}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            const Text("Asset Type:"),
                            const Spacer(),
                            Text(
                              "${phoneDto.type}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            const Text("Plate Number:"),
                            const Spacer(),
                            Text(
                              "${phoneDto.plate_number}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            const Text("TCode:"),
                            const Spacer(),
                            Text(
                              "${phoneDto.tin_number}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  InputDecorator(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(5)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        value: _pickedReason,
                        items: Reasons.values
                            .map((e) => DropdownMenuItem(
                                value: e, child: Text(e.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _pickedReason = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    inputFormatters: [LengthLimitingTextInputFormatter(501)],
                    controller: desc,
                    maxLines: 8, //or null
                    decoration: InputDecoration(
                      hintText: "Description (max 500)",
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      enabled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      // Background color
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 1.0, // Border width
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _pickedDate == null
                              ? 'Choose signout Start Date *'
                              : formatter.format(_pickedDate!),
                        ),
                        IconButton(
                          onPressed: _chooseCalender,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                                "Check this box if you DO NOT want to be automatically signed in the next day"),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isChecked
                      ? Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            // Background color
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1.0, // Border width
                            ),
                            borderRadius: BorderRadius.circular(
                                12.0), // Optional: Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(_image == null
                                          ? 'Upload Photo evidence (jpeg, jpg, png - max size 1mb) *'
                                          : ""),
                                    ),
                                    _image == null
                                        ? IconButton(
                                            onPressed: pickImage,
                                            icon: const Icon(
                                                Icons.camera_alt_rounded),
                                          )
                                        : Image.file(
                                            File(_image!.path),
                                            width: 100,
                                            height: 100,
                                          ),

                                    // Image.network(_image!.path,width: 200,height: 100,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Text(""),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, "/dashboard");
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: Colors.blueGrey),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: isLoading || (isChecked && _image == null)
                              ? null
                              : signOut,
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: Colors.blue),
                          child: const Text(
                            "Sign Out",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
