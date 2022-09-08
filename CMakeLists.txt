cmake_minimum_required(VERSION 3.0.0)
project(barcode_attendance VERSION 0.1.0)

include(CTest)
enable_testing()

add_library(barcode_attendance barcode_attendance.cpp)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
