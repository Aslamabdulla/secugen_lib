// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// import 'secugen_lib_method_channel.dart';

// abstract class SecugenLibPlatform extends PlatformInterface {
//   /// Constructs a SecugenLibPlatform.
//   SecugenLibPlatform() : super(token: _token);

//   static final Object _token = Object();

//   static SecugenLibPlatform _instance = MethodChannelSecugenLib();

//   /// The default instance of [SecugenLibPlatform] to use.
//   ///
//   /// Defaults to [MethodChannelSecugenLib].
//   static SecugenLibPlatform get instance => _instance;

//   /// Platform-specific implementations should set this with their own
//   /// platform-specific class that extends [SecugenLibPlatform] when
//   /// they register themselves.
//   static set instance(SecugenLibPlatform instance) {
//     PlatformInterface.verifyToken(instance, _token);
//     _instance = instance;
//   }

//   Future<String?> getPlatformVersion() {
//     throw UnimplementedError('platformVersion() has not been implemented.');
//   }
// }
