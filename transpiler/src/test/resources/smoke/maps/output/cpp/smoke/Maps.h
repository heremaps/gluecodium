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
using NestedMap = ::std::unordered_map< uint8_t, ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > >;
struct StructWithMap {
    ::std::unordered_map< int32_t, ::std::string > errorMapping;
};

public:
/**
 *
 * * @return The result type, containing ::std::unordered_map< int32_t, ::std::string > value.
 */
static ::std::unordered_map< int32_t, ::std::string > methodWithMap( const ::std::unordered_map< int32_t, ::std::string >& input );
/**
 *
 * * @return The result type, containing ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > value.
 */
static ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > methodWithMapToStruct( const ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct >& input );
/**
 *
 * * @return The result type, containing ::std::unordered_map< ::smoke::Maps::SomeStruct, uint8_t > value.
 */
static ::std::unordered_map< ::smoke::Maps::SomeStruct, uint8_t > methodWithStructAsMapKeys( const ::std::unordered_map< ::smoke::Maps::SomeStruct, uint8_t >& input );
/**
 *
 * * @return The result type, containing ::std::unordered_map< uint8_t, ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > > value.
 */
static ::std::unordered_map< uint8_t, ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > > methodWithNestedMap( const ::std::unordered_map< uint8_t, ::std::unordered_map< uint8_t, ::smoke::Maps::SomeStruct > >& input );
/**
 *
 * * @return The result type, containing ::smoke::Maps::StructWithMap value.
 */
static ::smoke::Maps::StructWithMap methodWithStructWithMap( const ::smoke::Maps::StructWithMap& input );

};

}
