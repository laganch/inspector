import 'dart:convert';
import 'dart:io';

import 'package:airs_inspector/baseUrl.dart';
import 'package:airs_inspector/models/signoutModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

bool isLoading = false;
final formatter = DateFormat.yMd();

enum Reasons { sick, mechanic, maintanance, travel }

var items = ['I was Sick', 'I went to the mechanic', 'I travelled'];

class UserApplications extends StatefulWidget {
  const UserApplications({super.key});

  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<UserApplications> {
  final plateNo = TextEditingController();
  final desc = TextEditingController();
  final reason = TextEditingController();
  Reasons _pickedReason = Reasons.sick;
  DateTime? _pickedDate;
  File? _image;

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
                CloseModal();
              },
              child: const Text("Close"))
        ],
      ),
    );
  }

  void signOut() async {
    if (plateNo.text.trim().isEmpty ||
        desc.text.trim().isEmpty ||
        _pickedDate == null) {
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
      "plate": plateNo.text,
      "image": _image != null ? convertIntoBase64(_image!) : "",
      "reason": _pickedReason.name
    });

    if (response == 'Successful') {
      showDialogMessage("Success Message",
          "Signout Application was \n $response", Colors.green);
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

  void CloseModal() {
    Navigator.pop(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: ListView(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
              child: Column(
                children: [
                  const Text(
                    "VEHICLE SIGNOUT FORM",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Kindly fill the form below to submit request for your vehicle/asset to be signout out. By clicking the Submit Button, your application will be submitted to an approving officer and upon approval, your vehicle will be signed out of the road starting from the selected start date.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),
                      LengthLimitingTextInputFormatter(14)
                    ],
                    controller: plateNo,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Plate Number/Tcode",
                      prefixIcon: const Icon(Icons.abc),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          _image == null
                              ? IconButton(
                                  onPressed: pickImage,
                                  icon: const Icon(Icons.camera_alt_rounded),
                                )
                              : Image.file(
                                  File(_image!.path),
                                  width: 100,
                                  height: 100,
                                ),
                          Text(_image == null ? 'Upload Photo evidence *' : ""),
                          Text(_image == null
                              ? '(jpeg, jpg, png - max size 1mb)'
                              : "")
                          // Image.network(_image!.path,width: 200,height: 100,)
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          IconButton(
                              onPressed: _chooseCalender,
                              icon: const Icon(Icons.calendar_month)),
                          Text(_pickedDate == null
                              ? 'Signout Start Date *'
                              : formatter.format(_pickedDate!)),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: CloseModal,
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
                          onPressed: signOut,
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: Colors.blue),
                          child: const Text(
                            "Submit Request",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : const Text(""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
