import 'package:flutter_test/flutter_test.dart';
import 'package:ios_external_link_account/ios_external_link_account.dart';
import 'package:ios_external_link_account/ios_external_link_account_platform_interface.dart';
import 'package:ios_external_link_account/ios_external_link_account_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIosExternalLinkAccountPlatform
    with MockPlatformInterfaceMixin
    implements IosExternalLinkAccountPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IosExternalLinkAccountPlatform initialPlatform = IosExternalLinkAccountPlatform.instance;

  test('$MethodChannelIosExternalLinkAccount is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIosExternalLinkAccount>());
  });

  test('getPlatformVersion', () async {
    IosExternalLinkAccount iosExternalLinkAccountPlugin = IosExternalLinkAccount();
    MockIosExternalLinkAccountPlatform fakePlatform = MockIosExternalLinkAccountPlatform();
    IosExternalLinkAccountPlatform.instance = fakePlatform;

    expect(await iosExternalLinkAccountPlugin.getPlatformVersion(), '42');
  });
}
