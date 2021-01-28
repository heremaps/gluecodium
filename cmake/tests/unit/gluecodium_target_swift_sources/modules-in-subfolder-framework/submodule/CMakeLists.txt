include(gluecodium/Gluecodium)

# Module 1, includes MAIN and COMMON source set
add_library(submodule.with.common ${TEST_COMMON_LIBRARY_TYPE})
target_sources(submodule.with.common PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/CommonMainFooImpl.cpp")

gluecodium_generate(submodule.with.common GENERATORS swift cpp)
gluecodium_target_lime_sources(submodule.with.common
                               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/lime/common_main_foo.lime")

# Module 2, includes only MAIN source set and depends on module 1
add_library(submodule.only.main ${TEST_MAIN_LIBRARY_TYPE})
target_sources(submodule.only.main PRIVATE "${CMAKE_CURRENT_LIST_DIR}/cpp/MainBarImpl.cpp"
               PUBLIC "${CMAKE_CURRENT_LIST_DIR}/cpp/Dummy.h")

target_link_libraries(submodule.only.main PUBLIC submodule.with.common)

gluecodium_generate(submodule.only.main GENERATORS swift cpp MAIN_ONLY)
gluecodium_target_lime_sources(submodule.only.main
                               PRIVATE "${CMAKE_CURRENT_LIST_DIR}/lime/main_bar.lime")
