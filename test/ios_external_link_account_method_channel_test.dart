import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_external_link_account/ios_external_link_account_method_channel.dart';

void main() {
  MethodChannelIosExternalLinkAccount platform = MethodChannelIosExternalLinkAccount();
  const MethodChannel channel = MethodChannel('ios_external_link_account');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
