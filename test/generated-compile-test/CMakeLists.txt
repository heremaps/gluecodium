cmake_minimum_required (VERSION 3.4)
project( GeneratedTestImpl )

set(GENERATED_BASE ${CMAKE_CURRENT_SOURCE_DIR}/../../transpiler/generated)

file(GLOB_RECURSE STUB_HEADERS "${GENERATED_BASE}/stub/*.h")

add_library( gentestlib
  ${STUB_HEADERS}

  ${GENERATED_BASE}/src/here/internal/expected.h
  ${GENERATED_BASE}/src/here/internal/ListenerVector.h

  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/guidance/GuidanceImpl.h
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/guidance/GuidanceImpl.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/NavcoreModuleImpl.h
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/NavcoreModuleImpl.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/NavcoreModuleFactoryImpl.h
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/NavcoreModuleFactoryImpl.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/RuntimeImpl.h
  ${CMAKE_CURRENT_SOURCE_DIR}/impl/navigation/RuntimeImpl.cpp
)
target_include_directories( gentestlib PUBLIC ${GENERATED_BASE} )
target_include_directories( gentestlib PUBLIC "${GENERATED_BASE}/src/" )

# force include all found headers into the main.cpp without needing to mention them by hand
foreach(HEADER IN LISTS ${STUB_HEADERS})
    if(MSVC)
        set_source_files_properties(main.cpp PROPERTIES COMPILE_FLAGS -FI stub/${HEADER})
    else()
        # GCC or Clang
        set_source_files_properties(main.cpp PROPERTIES COMPILE_FLAGS -include stub/${HEADER})
    endif()
endforeach(HEADER)

# enable c++11
target_compile_features( gentestlib PUBLIC cxx_range_for )

add_executable( gentestmain main.cpp)
target_link_libraries( gentestmain LINK_PUBLIC gentestlib )
