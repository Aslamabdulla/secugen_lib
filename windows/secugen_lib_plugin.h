#ifndef FLUTTER_PLUGIN_SECUGEN_LIB_PLUGIN_H_
#define FLUTTER_PLUGIN_SECUGEN_LIB_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace secugen_lib {

class SecugenLibPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SecugenLibPlugin();

  virtual ~SecugenLibPlugin();

  // Disallow copy and assign.
  SecugenLibPlugin(const SecugenLibPlugin&) = delete;
  SecugenLibPlugin& operator=(const SecugenLibPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace secugen_lib

#endif  // FLUTTER_PLUGIN_SECUGEN_LIB_PLUGIN_H_
