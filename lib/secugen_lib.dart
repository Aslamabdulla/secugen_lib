import 'dart:ffi'; // Import dart:ffi
import 'dart:io';
import 'dart:typed_data'; // Import dart:typed_data for Uint8List and Int32List

// Define your library name and its path

final DynamicLibrary nativeLib =DynamicLibrary.open(
    Platform.script.resolve("build/windows/x64/runner/Debug/secugen_lib_plugin.dll").toFilePath());

// C function typedefs
typedef NativeInitializeSecuGenSDKFunc = Int32 Function();
typedef NativeOpenDeviceFunc = Int32 Function();
typedef NativeCloseDeviceFunc = Int32 Function();
typedef NativeCaptureFingerprintFunc = Int32 Function(Pointer<Uint8> fingerprintBuffer, Int32 bufferSize);
typedef NativeCreateFingerprintTemplateFunc = Int32 Function(Pointer<Uint8> fpInfo, Pointer<Uint8> fingerprintBuffer, Pointer<Uint8> templateBuffer, Pointer<Int32> templateSize);
typedef NativeMatchFingerprintTemplatesFunc = Int32 Function(Pointer<Uint8> enrolledTemplateBuffer, Int32 enrolledTemplateSize, Pointer<Uint8> capturedTemplateBuffer, Int32 capturedTemplateSize, Pointer<Int32> matched);
typedef NativeGetFingerprintQualityFunc = Int32 Function(Pointer<Uint8> imgBuf, Int32 width, Int32 height, Pointer<Int32> qualityScore);
typedef NativeAdjustBrightnessFunc = Int32 Function(Int32 brightness);

// Dart function typedefs
typedef InitializeSecuGenSDKFunc = int Function();
typedef OpenDeviceFunc = int Function();
typedef CloseDeviceFunc = int Function();
typedef CaptureFingerprintFunc = int Function(Pointer<Uint8> fingerprintBuffer, int bufferSize);
typedef CreateFingerprintTemplateFunc = int Function(Pointer<Uint8> fpInfo, Pointer<Uint8> fingerprintBuffer, Pointer<Uint8> templateBuffer, Pointer<Int32> templateSize);
typedef MatchFingerprintTemplatesFunc = int Function(Pointer<Uint8> enrolledTemplateBuffer, int enrolledTemplateSize, Pointer<Uint8> capturedTemplateBuffer, int capturedTemplateSize, Pointer<Int32> matched);
typedef GetFingerprintQualityFunc = int Function(Pointer<Uint8> imgBuf, int width, int height, Pointer<Int32> qualityScore);
typedef AdjustBrightnessFunc = int Function(int brightness);

// Global instances of C functions
final InitializeSecuGenSDKFunc initializeSecuGenSDK = nativeLib
    .lookup<NativeFunction<NativeInitializeSecuGenSDKFunc>>('initializeSecuGenSDK')
    .asFunction<InitializeSecuGenSDKFunc>();

final OpenDeviceFunc openDevice = nativeLib
    .lookup<NativeFunction<NativeOpenDeviceFunc>>('openDevice')
    .asFunction<OpenDeviceFunc>();

final CloseDeviceFunc closeDevice = nativeLib
    .lookup<NativeFunction<NativeCloseDeviceFunc>>('closeDevice')
    .asFunction<CloseDeviceFunc>();

final CaptureFingerprintFunc captureFingerprint = nativeLib
    .lookup<NativeFunction<NativeCaptureFingerprintFunc>>('captureFingerprint')
    .asFunction<CaptureFingerprintFunc>();

final CreateFingerprintTemplateFunc createFingerprintTemplate = nativeLib
    .lookup<NativeFunction<NativeCreateFingerprintTemplateFunc>>('createFingerprintTemplate')
    .asFunction<CreateFingerprintTemplateFunc>();

final MatchFingerprintTemplatesFunc matchFingerprintTemplates = nativeLib
    .lookup<NativeFunction<NativeMatchFingerprintTemplatesFunc>>('matchFingerprintTemplates')
    .asFunction<MatchFingerprintTemplatesFunc>();

final GetFingerprintQualityFunc getFingerprintQuality = nativeLib
    .lookup<NativeFunction<NativeGetFingerprintQualityFunc>>('getFingerprintQuality')
    .asFunction<GetFingerprintQualityFunc>();

final AdjustBrightnessFunc adjustBrightness = nativeLib
    .lookup<NativeFunction<NativeAdjustBrightnessFunc>>('adjustBrightness')
    .asFunction<AdjustBrightnessFunc>();
