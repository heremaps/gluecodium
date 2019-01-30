// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once

#include "Export.h"
#include "alien/FooEnum.h"
#include "alien/FooStruct.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

namespace smoke {
class _GENIUM_CPP_EXPORT Arrays {
public:
    virtual ~Arrays() = 0;

public:
enum class SomeEnum {
    FOO,
    BAR
};

using UIntArray = ::std::vector< uint8_t >;
using StringArray = ::std::vector< ::std::string >;
using ProfileId = ::std::string;
using ProfileIdList = ::std::vector< ::smoke::Arrays::ProfileId >;
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
using ArrayOfMaps = ::std::vector< ::smoke::Arrays::ErrorCodeToMessageMap >;
using ErrorCodeToProfileIdMap = ::std::unordered_map< int32_t, ::smoke::Arrays::ProfileId >;
using ArrayOfAliasedMaps = ::std::vector< ::smoke::Arrays::ErrorCodeToProfileIdMap >;
using ArrayOfArrays = ::std::vector< ::smoke::Arrays::StringArray >;
using ArrayOfEnums = ::std::vector< ::smoke::Arrays::SomeEnum >;
using ArrayOfExternalEnums = ::std::vector< ::alien::FooEnum >;

struct _GENIUM_CPP_EXPORT BasicStruct {
    double value;
    BasicStruct( );
    BasicStruct( const double value );
};
using StructArray = ::std::vector< ::smoke::Arrays::BasicStruct >;
using ExternalStructArray = ::std::vector< ::alien::FooStruct >;
struct _GENIUM_CPP_EXPORT FancyStruct {
    ::smoke::Arrays::StringArray messages;
    ::std::vector< uint8_t > numbers;
    ::std::shared_ptr< ::std::vector< uint8_t > > image;
    FancyStruct( );
    FancyStruct( const ::smoke::Arrays::StringArray& messages, const ::std::vector< uint8_t >& numbers, const ::std::shared_ptr< ::std::vector< uint8_t > >& image );
};
using FancyArray = ::std::vector< ::smoke::Arrays::FancyStruct >;
public:
static ::smoke::Arrays::StringArray method_with_array( const ::smoke::Arrays::StringArray& input );
static ::std::vector< uint8_t > method_with_array_inline( const ::std::vector< uint8_t >& input );
static ::smoke::Arrays::StructArray method_with_struct_array( const ::std::vector< ::smoke::Arrays::BasicStruct >& input );
static ::smoke::Arrays::ExternalStructArray method_with_external_struct_array( const ::std::vector< ::alien::FooStruct >& input );
static ::std::vector< ::smoke::Arrays::UIntArray > method_with_array_of_arrays( const ::std::vector< ::smoke::Arrays::UIntArray >& input );
static ::smoke::Arrays::FancyArray merge_arrays_of_structs_with_arrays( const ::std::vector< ::smoke::Arrays::FancyStruct >& inline_fancy_array, const ::smoke::Arrays::FancyArray& fancy_array );
static ::smoke::Arrays::ProfileIdList method_with_array_of_aliases( const ::smoke::Arrays::ProfileIdList& input );
static ::smoke::Arrays::ArrayOfMaps method_with_array_of_maps( const ::smoke::Arrays::ArrayOfMaps& input );
static ::std::shared_ptr< ::std::vector< uint8_t > > method_with_byte_buffer( const ::std::shared_ptr< ::std::vector< uint8_t > >& input );
static ::smoke::Arrays::ArrayOfEnums method_with_enum_array( const ::std::vector< ::smoke::Arrays::SomeEnum >& input );
static ::smoke::Arrays::ArrayOfExternalEnums method_with_external_enum_array( const ::std::vector< ::alien::FooEnum >& input );
};
}
