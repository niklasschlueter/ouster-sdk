# Use the conda/env spdlog (CONFIG package) instead of the vendored header-only
# copy under thirdparty/spdlog (removed). Mixing the vendored spdlog with conda's
# libspdlog.so in one process is an ODR/ABI clash that segfaults at runtime.
if(NOT SPDLOG_INCLUDED)
  add_custom_target(SPDLOG_INCLUDED)
  find_package(spdlog CONFIG REQUIRED)
  if(NOT TARGET spdlog)
    add_library(spdlog INTERFACE IMPORTED)
    target_link_libraries(spdlog INTERFACE spdlog::spdlog)
  endif()
endif()
