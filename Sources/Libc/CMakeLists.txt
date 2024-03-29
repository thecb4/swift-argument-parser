# This source file is part of the Swift.org open source project
#
# Copyright (c) 2014 - 2019 Apple Inc. and the Swift project authors
# Licensed under Apache License v2.0 with Runtime Library Exception
#
# See http://swift.org/LICENSE.txt for license information
# See http://swift.org/CONTRIBUTORS.txt for Swift project authors

add_library(Libc
  libc.swift)

if(CMAKE_SYSTEM_NAME STREQUAL Windows)
  target_compile_options(Libc PRIVATE
    -autolink-force-load)
endif()
target_link_libraries(Libc PUBLIC
  TSCclibc)
# NOTE(compnerd) workaround for CMake not setting up include flags yet
set_target_properties(Libc PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_Swift_MODULE_DIRECTORY})

set_property(GLOBAL APPEND PROPERTY TSC_EXPORTS Libc)

if(CMAKE_SYSTEM_NAME STREQUAL Windows)
install(TARGETS Libc
  ARCHIVE DESTINATION lib
  LIBRARY DESTINATION lib
  RUNTIME DESTINATION bin)
endif()
