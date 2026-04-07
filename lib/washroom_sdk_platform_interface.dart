import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'washroom_sdk_method_channel.dart';

abstract class WashroomSdkPlatform extends PlatformInterface {
  /// Constructs a WashroomSdkPlatform.
  WashroomSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static WashroomSdkPlatform _instance = MethodChannelWashroomSdk();

  /// The default instance of [WashroomSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelWashroomSdk].
  static WashroomSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WashroomSdkPlatform] when
  /// they register themselves.
  static set instance(WashroomSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
