


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isw_mobile_sdk/isw_mobile_sdk.dart';
import 'package:isw_mobile_sdk/models/isw_mobile_sdk_payment_info.dart';
import 'package:isw_mobile_sdk/models/isw_mobile_sdk_sdk_config.dart';

class Payment extends StatefulWidget{
  const Payment({super.key});


  @override
  State<Payment> createState() => _Payment();
}

class _Payment extends State<Payment>{

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _amountString = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }



  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
        String  merchantId = "your-merchant-id",
          merchantCode = "your-merchant-code",
          merchantSecret = "your-merchant-secret",
          currencyCode = "currency-code";

      var config = IswSdkConfig(
        merchantId, 
        merchantSecret, 
        merchantCode, 
        currencyCode
      );

      // initialize the sdk
      await IswMobileSdk.initialize(config);
      // intialize with environment, default is Environment.TEST
      // IswMobileSdk.initialize(config, Environment.SANDBOX);

    } on PlatformException {}
  }

  Future<void> pay(BuildContext context) async {
    // save form
    _formKey.currentState!.save();
    
    String customerId = "<customer-id>",
        customerName = "<customer-name>",
        customerEmail = "<customer.email@domain.com>",
        customerMobile = "<customer-phone>",
        // generate a unique random
        // reference for each transaction
        reference = "<your-unique-ref>";

    int amount;
    // initialize amount
    if (_amountString.isEmpty) {
      amount = 2500 * 100;
    } else {
      amount = int.parse(_amountString) * 100;
    }

    // create payment info
    IswPaymentInfo iswPaymentInfo = IswPaymentInfo(customerId, customerName,
        customerEmail, customerMobile, reference, amount);

    print(iswPaymentInfo);

    // trigger payment
    var result = await IswMobileSdk.pay(iswPaymentInfo);

    String message;
    if (result.hasValue) {
      message = "You completed txn using: ${result.value?.channel}";
    } else {
      message = "You cancelled the transaction pls try again";
    }
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ));
  }
  
  
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asset Payment'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    onSaved: (newValue) => _amountString,
                  ),
                  Builder(
                    builder: (ctx) => SizedBox(
                      width: MediaQuery.of(ctx).size.width,
                      child: ElevatedButton(
                        child: const Text(
                          "Pay",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => pay(ctx),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}