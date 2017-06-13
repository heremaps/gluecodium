project(base_api_app)
cmake_minimum_required(VERSION 3.2)

set(SRC_LIST src/main.cpp)
add_executable(base_api_app ${SRC_LIST})

target_link_libraries(base_api_app hello)
target_compile_features(base_api_app PUBLIC cxx_range_for)
target_include_directories(base_api_app PUBLIC hello)
