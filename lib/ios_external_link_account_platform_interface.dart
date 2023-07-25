import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ios_external_link_account_method_channel.dart';

abstract class IosExternalLinkAccountPlatform extends PlatformInterface {
  /// Constructs a IosExternalLinkAccountPlatform.
  IosExternalLinkAccountPlatform() : super(token: _token);

  static final Object _token = Object();

  static IosExternalLinkAccountPlatform _instance =
      MethodChannelIosExternalLinkAccount();

  /// The default instance of [IosExternalLinkAccountPlatform] to use.
  ///
  /// Defaults to [MethodChannelIosExternalLinkAccount].
  static IosExternalLinkAccountPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IosExternalLinkAccountPlatform] when
  /// they register themselves.
  static set instance(IosExternalLinkAccountPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> canMakePayments() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> canOpen() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> open() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
