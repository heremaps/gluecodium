// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "enum_hash.h"
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
using ExampleMap = ::std::unordered_map< ::smoke::Enums::SimpleEnum, uint64_t, EnumHash >;
struct ErrorStruct {
    ::smoke::Enums::InternalError type;
    ::std::string message;
};

public:
static ::smoke::Enums::SimpleEnum method_with_enumeration( const ::smoke::Enums::SimpleEnum input );
static ::smoke::Enums::InternalError flip_enum_value( const ::smoke::Enums::InternalError input );
static ::smoke::Enums::InternalError extract_enum_from_struct( const ::smoke::Enums::ErrorStruct& input );
static ::smoke::Enums::ErrorStruct create_struct_with_enum_inside( const ::smoke::Enums::InternalError type, const ::std::string& message );
};
}
