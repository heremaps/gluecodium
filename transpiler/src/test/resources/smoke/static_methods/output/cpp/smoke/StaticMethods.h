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
#include <vector>
#include <string>

namespace smoke {

class StaticMethods {
public:
/**
 *
 * * @return The result type, containing bool value.
 */
static bool returnInvertedBoolean( const bool input );
/**
 *
 * * @return The result type, containing bool value.
 */
static bool returnAndBoolean( const bool input1, const bool input2 );
/**
 *
 * * @return The result type, containing ::std::vector< uint8_t > value.
 */
static ::std::vector< uint8_t > returnInputByteBuffer( const ::std::vector< uint8_t >& inputBuffer );
/**
 *
 * * @return The result type, containing ::std::vector< uint8_t > value.
 */
static ::std::vector< uint8_t > returnReverseByteBuffer( const ::std::vector< uint8_t >& inputBuffer );
/**
 *
 * * @return The result type, containing ::std::vector< uint8_t > value.
 */
static ::std::vector< uint8_t > concatenateByteBuffers( const ::std::vector< uint8_t >& input1, const ::std::vector< uint8_t >& input2 );
/**
 *
 * * @return The result type, containing float value.
 */
static float returnFloat( const float inputNumber );
/**
 *
 * * @return The result type, containing float value.
 */
static float returnIncrementedFloat( const float inputNumber );
/**
 *
 * * @return The result type, containing float value.
 */
static float sumTwoFloats( const float inputNumber1, const float inputNumber2 );
/**
 *
 * * @return The result type, containing double value.
 */
static double returnDouble( const double inputNumber );
/**
 *
 * * @return The result type, containing double value.
 */
static double returnIncrementedDouble( const double inputNumber );
/**
 *
 * * @return The result type, containing double value.
 */
static double sumTwoDoubles( const double inputNumber1, const double inputNumber2 );
/**
 *
 * * @return The result type, containing int8_t value.
 */
static int8_t returnNextNumberINT8( const int8_t inputNumber );
/**
 *
 * * @return The result type, containing int8_t value.
 */
static int8_t sumTwoNumbersINT8( const int8_t inputNumber1, const int8_t inputNumber2 );
/**
 *
 * * @return The result type, containing int8_t value.
 */
static int8_t returnPrimeINT8(  );
/**
 *
 * * @return The result type, containing uint8_t value.
 */
static uint8_t returnNextNumberUINT8( const uint8_t inputNumber );
/**
 *
 * * @return The result type, containing uint8_t value.
 */
static uint8_t sumTwoNumbersUINT8( const uint8_t inputNumber1, const uint8_t inputNumber2 );
/**
 *
 * * @return The result type, containing uint8_t value.
 */
static uint8_t returnPrimeUINT8(  );
/**
 *
 * * @return The result type, containing int16_t value.
 */
static int16_t returnNextNumberINT16( const int16_t inputNumber );
/**
 *
 * * @return The result type, containing int16_t value.
 */
static int16_t sumTwoNumbersINT16( const int16_t inputNumber1, const int16_t inputNumber2 );
/**
 *
 * * @return The result type, containing int16_t value.
 */
static int16_t returnPrimeINT16(  );
/**
 *
 * * @return The result type, containing uint16_t value.
 */
static uint16_t returnNextNumberUINT16( const uint16_t inputNumber );
/**
 *
 * * @return The result type, containing uint16_t value.
 */
static uint16_t sumTwoNumbersUINT16( const uint16_t inputNumber1, const uint16_t inputNumber2 );
/**
 *
 * * @return The result type, containing uint16_t value.
 */
static uint16_t returnPrimeUINT16(  );
/**
 *
 * * @return The result type, containing int32_t value.
 */
static int32_t returnNextNumberINT32( const int32_t inputNumber );
/**
 *
 * * @return The result type, containing int32_t value.
 */
static int32_t sumTwoNumbersINT32( const int32_t inputNumber1, const int32_t inputNumber2 );
/**
 *
 * * @return The result type, containing int32_t value.
 */
static int32_t returnPrimeINT32(  );
/**
 *
 * * @return The result type, containing uint32_t value.
 */
static uint32_t returnNextNumberUINT32( const uint32_t inputNumber );
/**
 *
 * * @return The result type, containing uint32_t value.
 */
static uint32_t sumTwoNumbersUINT32( const uint32_t inputNumber1, const uint32_t inputNumber2 );
/**
 *
 * * @return The result type, containing uint32_t value.
 */
static uint32_t returnPrimeUINT32(  );
/**
 *
 * * @return The result type, containing int64_t value.
 */
static int64_t returnNextNumberINT64( const int64_t inputNumber );
/**
 *
 * * @return The result type, containing int64_t value.
 */
static int64_t sumTwoNumbersINT64( const int64_t inputNumber1, const int64_t inputNumber2 );
/**
 *
 * * @return The result type, containing int64_t value.
 */
static int64_t returnPrimeINT64(  );
/**
 *
 * * @return The result type, containing uint64_t value.
 */
static uint64_t returnNextNumberUINT64( const uint64_t inputNumber );
/**
 *
 * * @return The result type, containing uint64_t value.
 */
static uint64_t sumTwoNumbersUINT64( const uint64_t inputNumber1, const uint64_t inputNumber2 );
/**
 *
 * * @return The result type, containing uint64_t value.
 */
static uint64_t returnPrimeUINT64(  );
/**
 *
 * * @return The result type, containing ::std::string value.
 */
static ::std::string returnInputString( const ::std::string& inputString );
/**
 *
 * * @return The result type, containing ::std::string value.
 */
static ::std::string concatenateStrings( const ::std::string& inputString1, const ::std::string& inputString2 );
/**
 *
 * * @return The result type, containing ::std::string value.
 */
static ::std::string returnHelloString(  );
/**
 *
 * * @return The result type, containing ::std::string value.
 */
static ::std::string returnEmpty(  );

};

}
