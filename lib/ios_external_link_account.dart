import 'ios_external_link_account_platform_interface.dart';

class IosExternalLinkAccount {
  Future<String?> getPlatformVersion() {
    return IosExternalLinkAccountPlatform.instance.getPlatformVersion();
  }

  Future<bool?> canMakePayments() {
    return IosExternalLinkAccountPlatform.instance.canMakePayments();
  }

  Future<bool?> canOpen() {
    return IosExternalLinkAccountPlatform.instance.canOpen();
  }

  Future<bool?> open() {
    return IosExternalLinkAccountPlatform.instance.open();
  }
}
