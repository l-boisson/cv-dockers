cmake_minimum_required(VERSION 3.10)
project(hellow)

set(CMAKE_CXX_STANDARD 17)
find_package(OpenCV REQUIRED)
include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(hello_world hello_world.cpp)
target_link_libraries(hello_world ${OpenCV_LIBS})
