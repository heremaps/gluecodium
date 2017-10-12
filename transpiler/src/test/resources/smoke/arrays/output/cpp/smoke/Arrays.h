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
#include <limits>
#include <string>
#include <vector>

namespace smoke {

class Arrays {
public:
using UIntArray = ::std::vector< uint8_t >;
using StringArray = ::std::vector< ::std::string >;
struct BasicStruct {
    double value = std::numeric_limits< double >::quiet_NaN( );
};
using StructArray = ::std::vector< ::smoke::Arrays::BasicStruct >;
struct FancyStruct {
    ::std::vector< ::std::string > messages;
    ::std::vector< uint8_t > numbers;
};
using FancyArray = ::std::vector< ::smoke::Arrays::FancyStruct >;

public:
/**
 *
 * * @return The result type, containing ::std::vector< ::std::string > value.
 */
static ::std::vector< ::std::string > methodWithArray( const ::std::vector< ::std::string >& input );
/**
 *
 * * @return The result type, containing ::std::vector< uint8_t > value.
 */
static ::std::vector< uint8_t > methodWithArrayInline( const ::std::vector< uint8_t >& input );
/**
 *
 * * @return The result type, containing ::std::vector< ::smoke::Arrays::BasicStruct > value.
 */
static ::std::vector< ::smoke::Arrays::BasicStruct > methodWithStructArray( const ::std::vector< ::smoke::Arrays::BasicStruct >& input );
/**
 *
 * * @return The result type, containing ::std::vector< ::std::vector< uint8_t > > value.
 */
static ::std::vector< ::std::vector< uint8_t > > methodWithArrayOfArrys( const ::std::vector< ::std::vector< uint8_t > >& input );
/**
 *
 * * @return The result type, containing ::std::vector< ::smoke::Arrays::FancyStruct > value.
 */
static ::std::vector< ::smoke::Arrays::FancyStruct > mergeArraysOfStructsWithArrays( const ::std::vector< ::smoke::Arrays::FancyStruct >& inlineFancyArray, const ::std::vector< ::smoke::Arrays::FancyStruct >& fancyArray );

};

}
