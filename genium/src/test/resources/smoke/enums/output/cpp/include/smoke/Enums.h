// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "EnumHash.h"
#include "foo/Bar.h"
#include <cstdint>
#include <string>
#include <unordered_map>

namespace smoke {

class Enums {
public:
    virtual ~Enums() = 0;
public:
enum class SimpleEnum {
    FIRST,
    SECOND
};
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL = 999
};
using ExampleMap = ::std::unordered_map< ::smoke::Enums::SimpleEnum, uint64_t, ::genium::EnumHash >;
struct ErrorStruct {
    ::smoke::Enums::InternalError type;
    ::std::string message;
};

public:
static ::smoke::Enums::SimpleEnum method_with_enumeration( const ::smoke::Enums::SimpleEnum input );
static ::smoke::Enums::InternalError flip_enum_value( const ::smoke::Enums::InternalError input );
static ::smoke::Enums::InternalError extract_enum_from_struct( const ::smoke::Enums::ErrorStruct& input );
static ::smoke::Enums::ErrorStruct create_struct_with_enum_inside( const ::smoke::Enums::InternalError type, const ::std::string& message );
static void method_with_external_enum( const ::fire::SomeVeryExternalEnum input );
};
}
