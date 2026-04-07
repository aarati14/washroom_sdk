import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'washroom_sdk_platform_interface.dart';

/// An implementation of [WashroomSdkPlatform] that uses method channels.
class MethodChannelWashroomSdk extends WashroomSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('washroom_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
