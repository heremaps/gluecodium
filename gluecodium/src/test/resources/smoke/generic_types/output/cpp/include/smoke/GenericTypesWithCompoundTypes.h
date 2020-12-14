// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/UnorderedSetHash.h"
#include "gluecodium/VectorHash.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <vector>
namespace smoke {
    class DummyClass;
    class DummyInterface;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT GenericTypesWithCompoundTypes {
public:
    GenericTypesWithCompoundTypes();
    virtual ~GenericTypesWithCompoundTypes() = 0;
public:
    enum class SomeEnum {
        FOO,
        BAR
    };
    struct _GLUECODIUM_CPP_EXPORT BasicStruct {
        double value;
        BasicStruct( );
        BasicStruct( double value );
    };
public:
    virtual ::std::vector< ::alien::FooStruct > method_with_struct_list( const ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >& input ) = 0;
    virtual ::std::unordered_map< ::std::string, ::alien::FooStruct > method_with_struct_map( const ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >& input ) = 0;
    virtual ::std::vector< ::alien::FooEnum > method_with_enum_list( const ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >& input ) = 0;
    virtual ::std::unordered_map< ::alien::FooEnum, bool, ::gluecodium::hash< ::alien::FooEnum > > method_with_enum_map_key( const ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >& input ) = 0;
    virtual ::std::unordered_map< int32_t, ::alien::FooEnum > method_with_enum_map_value( const ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >& input ) = 0;
    virtual ::std::unordered_set< ::alien::FooEnum, ::gluecodium::hash< ::alien::FooEnum > > method_with_enum_set( const ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >& input ) = 0;
    virtual ::std::vector< ::std::shared_ptr< ::smoke::DummyInterface > > method_with_instances_list( const ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >& input ) = 0;
    virtual ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyInterface > > method_with_instances_map( const ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >& input ) = 0;
};
}
