//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
void smoke_StaticMethods_release_handle(_baseRef handle);
_baseRef smoke_StaticMethods_copy_handle(_baseRef handle);
bool smoke_StaticMethods_returnInvertedBoolean(bool input);
bool smoke_StaticMethods_returnAndBoolean(bool input1, bool input2);
_baseRef smoke_StaticMethods_returnInputByteBuffer(_baseRef inputBuffer);
_baseRef smoke_StaticMethods_returnReverseByteBuffer(_baseRef inputBuffer);
_baseRef smoke_StaticMethods_concatenateByteBuffers(_baseRef input1, _baseRef input2);
float smoke_StaticMethods_returnFloat(float inputNumber);
float smoke_StaticMethods_returnIncrementedFloat(float inputNumber);
float smoke_StaticMethods_sumTwoFloats(float inputNumber1, float inputNumber2);
double smoke_StaticMethods_returnDouble(double inputNumber);
double smoke_StaticMethods_returnIncrementedDouble(double inputNumber);
double smoke_StaticMethods_sumTwoDoubles(double inputNumber1, double inputNumber2);
int8_t smoke_StaticMethods_returnNextNumberINT8(int8_t inputNumber);
int8_t smoke_StaticMethods_sumTwoNumbersINT8(int8_t inputNumber1, int8_t inputNumber2);
int8_t smoke_StaticMethods_returnPrimeINT8();
uint8_t smoke_StaticMethods_returnNextNumberUINT8(uint8_t inputNumber);
uint8_t smoke_StaticMethods_sumTwoNumbersUINT8(uint8_t inputNumber1, uint8_t inputNumber2);
uint8_t smoke_StaticMethods_returnPrimeUINT8();
int16_t smoke_StaticMethods_returnNextNumberINT16(int16_t inputNumber);
int16_t smoke_StaticMethods_sumTwoNumbersINT16(int16_t inputNumber1, int16_t inputNumber2);
int16_t smoke_StaticMethods_returnPrimeINT16();
uint16_t smoke_StaticMethods_returnNextNumberUINT16(uint16_t inputNumber);
uint16_t smoke_StaticMethods_sumTwoNumbersUINT16(uint16_t inputNumber1, uint16_t inputNumber2);
uint16_t smoke_StaticMethods_returnPrimeUINT16();
int32_t smoke_StaticMethods_returnNextNumberINT32(int32_t inputNumber);
int32_t smoke_StaticMethods_sumTwoNumbersINT32(int32_t inputNumber1, int32_t inputNumber2);
int32_t smoke_StaticMethods_returnPrimeINT32();
uint32_t smoke_StaticMethods_returnNextNumberUINT32(uint32_t inputNumber);
uint32_t smoke_StaticMethods_sumTwoNumbersUINT32(uint32_t inputNumber1, uint32_t inputNumber2);
uint32_t smoke_StaticMethods_returnPrimeUINT32();
int64_t smoke_StaticMethods_returnNextNumberINT64(int64_t inputNumber);
int64_t smoke_StaticMethods_sumTwoNumbersINT64(int64_t inputNumber1, int64_t inputNumber2);
int64_t smoke_StaticMethods_returnPrimeINT64();
uint64_t smoke_StaticMethods_returnNextNumberUINT64(uint64_t inputNumber);
uint64_t smoke_StaticMethods_sumTwoNumbersUINT64(uint64_t inputNumber1, uint64_t inputNumber2);
uint64_t smoke_StaticMethods_returnPrimeUINT64();
_baseRef smoke_StaticMethods_returnInputString(_baseRef inputString);
_baseRef smoke_StaticMethods_concatenateStrings(_baseRef inputString1, _baseRef inputString2);
_baseRef smoke_StaticMethods_returnHelloString();
_baseRef smoke_StaticMethods_returnEmpty();
#ifdef __cplusplus
}
#endif