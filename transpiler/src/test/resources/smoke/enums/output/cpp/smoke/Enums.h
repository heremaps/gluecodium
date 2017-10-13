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

#include "cpp/enum_hash.h"
#include <cstdint>
#include <string>
#include <unordered_map>

namespace smoke {

class Enums {
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
/**
 *
 * * @return The result type, containing ::smoke::Enums::SimpleEnum value.
 */
static ::smoke::Enums::SimpleEnum methodWithEnumeration( const ::smoke::Enums::SimpleEnum input );
/**
 *
 * * @return The result type, containing ::smoke::Enums::InternalError value.
 */
static ::smoke::Enums::InternalError flipEnumValue( const ::smoke::Enums::InternalError input );
/**
 *
 * * @return The result type, containing ::smoke::Enums::InternalError value.
 */
static ::smoke::Enums::InternalError extractEnumFromStruct( const ::smoke::Enums::ErrorStruct& input );
/**
 *
 * * @return The result type, containing ::smoke::Enums::ErrorStruct value.
 */
static ::smoke::Enums::ErrorStruct createStructWithEnumInside( const ::smoke::Enums::InternalError type, const ::std::string& message );
};
}
