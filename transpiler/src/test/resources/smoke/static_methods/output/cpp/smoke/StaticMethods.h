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
#include <vector>

namespace smoke {

class StaticMethods {
public:
static bool returnInvertedBoolean( const bool input );
static bool returnAndBoolean( const bool input1, const bool input2 );
static ::std::vector< uint8_t > returnInputByteBuffer( const ::std::vector< uint8_t >& inputBuffer );
static ::std::vector< uint8_t > returnReverseByteBuffer( const ::std::vector< uint8_t >& inputBuffer );
static ::std::vector< uint8_t > concatenateByteBuffers( const ::std::vector< uint8_t >& input1, const ::std::vector< uint8_t >& input2 );
static float returnFloat( const float inputNumber );
static float returnIncrementedFloat( const float inputNumber );
static float sumTwoFloats( const float inputNumber1, const float inputNumber2 );
static double returnDouble( const double inputNumber );
static double returnIncrementedDouble( const double inputNumber );
static double sumTwoDoubles( const double inputNumber1, const double inputNumber2 );
static int8_t returnNextNumberINT8( const int8_t inputNumber );
static int8_t sumTwoNumbersINT8( const int8_t inputNumber1, const int8_t inputNumber2 );
static int8_t returnPrimeINT8(  );
static uint8_t returnNextNumberUINT8( const uint8_t inputNumber );
static uint8_t sumTwoNumbersUINT8( const uint8_t inputNumber1, const uint8_t inputNumber2 );
static uint8_t returnPrimeUINT8(  );
static int16_t returnNextNumberINT16( const int16_t inputNumber );
static int16_t sumTwoNumbersINT16( const int16_t inputNumber1, const int16_t inputNumber2 );
static int16_t returnPrimeINT16(  );
static uint16_t returnNextNumberUINT16( const uint16_t inputNumber );
static uint16_t sumTwoNumbersUINT16( const uint16_t inputNumber1, const uint16_t inputNumber2 );
static uint16_t returnPrimeUINT16(  );
static int32_t returnNextNumberINT32( const int32_t inputNumber );
static int32_t sumTwoNumbersINT32( const int32_t inputNumber1, const int32_t inputNumber2 );
static int32_t returnPrimeINT32(  );
static uint32_t returnNextNumberUINT32( const uint32_t inputNumber );
static uint32_t sumTwoNumbersUINT32( const uint32_t inputNumber1, const uint32_t inputNumber2 );
static uint32_t returnPrimeUINT32(  );
static int64_t returnNextNumberINT64( const int64_t inputNumber );
static int64_t sumTwoNumbersINT64( const int64_t inputNumber1, const int64_t inputNumber2 );
static int64_t returnPrimeINT64(  );
static uint64_t returnNextNumberUINT64( const uint64_t inputNumber );
static uint64_t sumTwoNumbersUINT64( const uint64_t inputNumber1, const uint64_t inputNumber2 );
static uint64_t returnPrimeUINT64(  );
static ::std::string returnInputString( const ::std::string& inputString );
static ::std::string concatenateStrings( const ::std::string& inputString1, const ::std::string& inputString2 );
static ::std::string returnHelloString(  );
static ::std::string returnEmpty(  );

};

}
