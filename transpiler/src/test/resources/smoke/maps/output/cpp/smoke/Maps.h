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
    ::smoke::Maps::ErrorCodeToMessageMap errorMapping;
};

public:
static ::smoke::Maps::ErrorCodeToMessageMap methodWithMap( const ::smoke::Maps::ErrorCodeToMessageMap& input );
static ::smoke::Maps::NumberToStruct methodWithMapToStruct( const ::smoke::Maps::NumberToStruct& input );
static ::smoke::Maps::StructToNumber methodWithStructAsMapKeys( const ::smoke::Maps::StructToNumber& input );
static ::smoke::Maps::NestedMap methodWithNestedMap( const ::smoke::Maps::NestedMap& input );
static ::smoke::Maps::StructWithMap methodWithStructWithMap( const ::smoke::Maps::StructWithMap& input );

};

}
