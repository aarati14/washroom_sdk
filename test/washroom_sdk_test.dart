import 'package:flutter_test/flutter_test.dart';
import 'package:washroom_sdk/washroom_sdk.dart';
import 'package:washroom_sdk/washroom_sdk_platform_interface.dart';
import 'package:washroom_sdk/washroom_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWashroomSdkPlatform
    with MockPlatformInterfaceMixin
    implements WashroomSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WashroomSdkPlatform initialPlatform = WashroomSdkPlatform.instance;

  test('$MethodChannelWashroomSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWashroomSdk>());
  });

  test('getPlatformVersion', () async {
    WashroomSdk washroomSdkPlugin = WashroomSdk();
    MockWashroomSdkPlatform fakePlatform = MockWashroomSdkPlatform();
    WashroomSdkPlatform.instance = fakePlatform;

    expect(await washroomSdkPlugin.getPlatformVersion(), '42');
  });
}
