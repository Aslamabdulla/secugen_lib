// import 'dart:ffi'; // Import dart:ffi for FFI
// import 'dart:io' show Platform; // Import Platform for platform-specific path handling

// class NativeLib {
//   // Singleton instance
//   static final NativeLib _singleton = NativeLib._internal();

//   factory NativeLib() => _singleton;

//   NativeLib._internal();

//   // Load the native library based on platform
//   DynamicLibrary loadLibrary() {
//     String path = '';
//     if (Platform.isWindows) {
//       path = 'path_to_your_shared_library.dll'; // Replace with your DLL path
//     } else if (Platform.isLinux) {
//       path = 'path_to_your_shared_library.so'; // Replace with your SO path
//     } else if (Platform.isMacOS) {
//       path = 'path_to_your_shared_library.dylib'; // Replace with your dylib path
//     } else {
//       throw Exception('Unsupported platform');
//     }
//     return DynamicLibrary.open(path);
//   }
// }
