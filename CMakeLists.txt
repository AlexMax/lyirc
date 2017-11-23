cmake_minimum_required(VERSION 3.1)
project(lyirc VERSION 0.1 LANGUAGES CXX)

list(APPEND CMAKE_PREFIX_PATH "cmake")

find_package(Ragel REQUIRED)

set(wxWidgets_CONFIGURATION mswud)
find_package(wxWidgets COMPONENTS base core REQUIRED)

add_subdirectory(lib)
add_subdirectory(src)