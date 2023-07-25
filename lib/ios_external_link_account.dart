import 'package:flutter/services.dart';

class IosExternalLinkAccount {
  static final IosExternalLinkAccount _obj = IosExternalLinkAccount._internal();

  factory IosExternalLinkAccount() {
    return _obj;
  }

  IosExternalLinkAccount._internal();

  final methodChannel = const MethodChannel('ios_external_link_account');

  Future<bool?> canMakePayments() async {
    final canMakePayment =
        await methodChannel.invokeMethod<bool>('canMakePayments');
    return canMakePayment;
  }

  Future<bool?> canOpen() async {
    final canOpen = await methodChannel.invokeMethod<bool>('canOpen');
    return canOpen;
  }

  Future<bool?> open() async {
    final open = await methodChannel.invokeMethod<bool>('open');
    return open;
  }
}
