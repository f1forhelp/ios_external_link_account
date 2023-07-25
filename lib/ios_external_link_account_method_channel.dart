import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ios_external_link_account_platform_interface.dart';

/// An implementation of [IosExternalLinkAccountPlatform] that uses method channels.
class MethodChannelIosExternalLinkAccount
    extends IosExternalLinkAccountPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ios_external_link_account');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> canMakePayments() async {
    final canMakePayment =
        await methodChannel.invokeMethod<bool>('canMakePayments');
    return canMakePayment;
  }

  @override
  Future<bool?> canOpen() async {
    final canOpen = await methodChannel.invokeMethod<bool>('canOpen');
    return canOpen;
  }

  @override
  Future<bool?> open() async {
    final open = await methodChannel.invokeMethod<bool>('open');
    return open;
  }
}
