cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "secugen_lib")
project(${PROJECT_NAME} LANGUAGES CXX)

# Explicitly opt in to modern CMake behaviors to avoid warnings with recent versions of CMake.
cmake_policy(VERSION 3.14...3.25)

# This value is used when generating builds using this plugin, so it must not be changed.
set(PLUGIN_NAME "secugen_lib_plugin")

# Any new source files that you add to the plugin should be added here.
list(APPEND PLUGIN_SOURCES
  "secugen_lib_plugin.cpp"
  "secugen_lib_plugin.h"
  "src/sgfplib_c_wrapper.cpp"
  "src/secugen_lib.cpp"
)

# Define the plugin library target. Its name must not be changed (see comment on PLUGIN_NAME above).
add_library(${PLUGIN_NAME} SHARED
  "include/secugen_lib/secugen_lib_plugin_c_api.h"
  "src/sgfplib.h"
  "src/sgfplib_c_wrapper.h"
  "secugen_lib_plugin_c_api.cpp"
  ${PLUGIN_SOURCES}
)

# Apply a standard set of build settings that are configured in the application-level CMakeLists.txt.
# This can be removed for plugins that want full control over build settings.
apply_standard_settings(${PLUGIN_NAME})

# Symbols are hidden by default to reduce the chance of accidental conflicts between plugins.
# This should not be removed; any symbols that should be exported should be explicitly exported with the FLUTTER_PLUGIN_EXPORT macro.
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)

# Source include directories and library dependencies. Add any plugin-specific dependencies here.
target_include_directories(${PLUGIN_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/secugen_lib")
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include" "${CMAKE_CURRENT_SOURCE_DIR}/include/secugen_lib")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# Link the SecuGen SDK libraries
target_link_libraries(${PLUGIN_NAME} PRIVATE
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgfplib.lib"

)

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an external build triggered from this build file.
set(secugen_lib_bundled_libraries
  ""
  PARENT_SCOPE
)
add_custom_command(TARGET ${PLUGIN_NAME} POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgfplib.dll"
  $<IF:$<CONFIG:Debug>,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Debug,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Release>
  
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgfpamx.dll"
  $<IF:$<CONFIG:Debug>,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Debug,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Release>
  
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgwsqlib.dll"
  $<IF:$<CONFIG:Debug>,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Debug,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Release>
  
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgfdusdax64.dll"
  $<IF:$<CONFIG:Debug>,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Debug,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Release>
  
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
  "C:/Users/aryap/secugen_finger_windows/secugen_lib/windows/dlls/x64/sgbledev.dll"
  $<IF:$<CONFIG:Debug>,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Debug,$<TARGET_FILE_DIR:${PLUGIN_NAME}>/Release>
)
# === Tests ===
# These unit tests can be run from a terminal after building the example, or from Visual Studio after opening the generated solution file.

# Only enable test builds when building the example (which sets this variable) so that plugin clients aren't building the tests.
if (${include_${PROJECT_NAME}_tests})
  set(TEST_RUNNER "${PROJECT_NAME}_test")
  enable_testing()

  # Add the Google Test dependency.
  include(FetchContent)
  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/release-1.11.0.zip
  )
  # Prevent overriding the parent project's compiler/linker settings.
  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
  # Disable install commands for gtest so it doesn't end up in the bundle.
  set(INSTALL_GTEST OFF CACHE BOOL "Disable installation of googletest" FORCE)
  FetchContent_MakeAvailable(googletest)

  # The plugin's C API is not very useful for unit testing, so build the sources directly into the test binary rather than using the DLL.
  add_executable(${TEST_RUNNER}
    test/secugen_lib_plugin_test.cpp
    ${PLUGIN_SOURCES}
  )
  apply_standard_settings(${TEST_RUNNER})
  target_include_directories(${TEST_RUNNER} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  target_link_libraries(${TEST_RUNNER} PRIVATE flutter_wrapper_plugin)
  target_link_libraries(${TEST_RUNNER} PRIVATE gtest_main gmock)
  # flutter_wrapper_plugin has link dependencies on the Flutter DLL.
  add_custom_command(TARGET ${TEST_RUNNER} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    "${FLUTTER_LIBRARY}" $<TARGET_FILE_DIR:${TEST_RUNNER}>
  )

  # Enable automatic test discovery.
  include(GoogleTest)
  gtest_discover_tests(${TEST_RUNNER})
endif()
