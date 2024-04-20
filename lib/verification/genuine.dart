import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../myApp.dart';

class Original extends StatefulWidget {
  const Original({super.key});

  @override
  State<StatefulWidget> createState() => _Original();
}

class _Original extends State<Original> {
  
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
                        return  const MainApp();
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
                "Enter Vehicle Number",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]')),LengthLimitingTextInputFormatter(14)],
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
                    onPressed: () {
                    },
                    child: const Text("Search", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
