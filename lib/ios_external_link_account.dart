import 'package:flutter/services.dart';

class IosExternalLinkAccount {
  static final IosExternalLinkAccount _obj = IosExternalLinkAccount._internal();

  IosExternalLinkAccount factory() {
    return _obj;
  }

  IosExternalLinkAccount._internal();

  final methodChannel = const MethodChannel('ios_external_link_account');

  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

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
