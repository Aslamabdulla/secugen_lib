// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';

// import 'secugen_lib_platform_interface.dart';

// /// An implementation of [SecugenLibPlatform] that uses method channels.
// class MethodChannelSecugenLib extends SecugenLibPlatform {
//   /// The method channel used to interact with the native platform.
//   @visibleForTesting
//   final methodChannel = const MethodChannel('secugen_lib');

//   @override
//   Future<String?> getPlatformVersion() async {
//     final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
//     return version;
//   }
// }
