#include "include/secugen_lib/secugen_lib_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "secugen_lib_plugin.h"

void SecugenLibPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  secugen_lib::SecugenLibPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
