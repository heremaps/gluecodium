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
#include <cstdint>
#include <string>
#include <unordered_map>

namespace smoke {

class Maps {
public:
using ErrorCodeToMessageMap = ::std::unordered_map< int32_t, ::std::string >;
struct SomeStruct {
    ::std::string value;
};

using NumberToStruct = ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct >;
using StructToNumber = ::std::unordered_map< ::smoke::Maps::SomeStruct, uint8_t >;
using NestedMap = ::std::unordered_map< uint8_t, ::smoke::Maps::NumberToStruct >;

struct StructWithMap {
    ::smoke::Maps::ErrorCodeToMessageMap error_mapping;
};

public:
static ::smoke::Maps::ErrorCodeToMessageMap method_with_map( const ::smoke::Maps::ErrorCodeToMessageMap& input );
static ::smoke::Maps::NumberToStruct method_with_map_to_struct( const ::smoke::Maps::NumberToStruct& input );
static ::smoke::Maps::StructToNumber method_with_struct_as_map_keys( const ::smoke::Maps::StructToNumber& input );
static ::smoke::Maps::NestedMap method_with_nested_map( const ::smoke::Maps::NestedMap& input );
static ::smoke::Maps::StructWithMap method_with_struct_with_map( const ::smoke::Maps::StructWithMap& input );
};
}