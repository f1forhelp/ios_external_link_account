import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ios_external_link_account/ios_external_link_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? canMakePayment;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      initPlatformState();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      canMakePayment = await IosExternalLinkAccount().canMakePayments();

      if (canMakePayment ?? false) {
        if (await IosExternalLinkAccount().canOpen() ?? false) {
          IosExternalLinkAccount().open();
        }
      }
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Can make payment : ${canMakePayment}"),
            ],
          ),
        ),
      ),
    );
  }
}
