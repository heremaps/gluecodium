cmake_minimum_required (VERSION 3.4)
project( GeneratedTestImpl )

set(GENERATED_BASE ${CMAKE_CURRENT_SOURCE_DIR}/../../transpiler/generated)

add_library( gentestlib
  ${GENERATED_BASE}/stub/navigation/guidance/GuidanceTypes.h
  ${GENERATED_BASE}/stub/navigation/guidance/GuidanceStub.h
  ${GENERATED_BASE}/stub/navigation/routing/RoutingTypes.h
  ${GENERATED_BASE}/stub/navigation/routing/RouteStub.h
  ${GENERATED_BASE}/stub/navigation/NavigationTypes.h
  ${GENERATED_BASE}/stub/navigation/RuntimeStub.h
  ${GENERATED_BASE}/stub/navigation/ModuleStub.h
  ${GENERATED_BASE}/stub/navigation/ModuleFactoryStub.h

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

# enable c++11
target_compile_features( gentestlib PUBLIC cxx_range_for )

add_executable( gentestmain main.cpp)
target_link_libraries( gentestmain LINK_PUBLIC gentestlib )
