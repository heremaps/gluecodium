//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/ByteArrayHandle.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
_GENIUM_C_EXPORT void smoke_StaticMethods_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT bool smoke_StaticMethods_returnInvertedBoolean(bool input);
_GENIUM_C_EXPORT bool smoke_StaticMethods_returnAndBoolean(bool input1, bool input2);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_returnInputByteBuffer(_baseRef inputBuffer);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_returnReverseByteBuffer(_baseRef inputBuffer);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_concatenateByteBuffers(_baseRef input1, _baseRef input2);
_GENIUM_C_EXPORT float smoke_StaticMethods_returnFloat(float inputNumber);
_GENIUM_C_EXPORT float smoke_StaticMethods_returnIncrementedFloat(float inputNumber);
_GENIUM_C_EXPORT float smoke_StaticMethods_sumTwoFloats(float inputNumber1, float inputNumber2);
_GENIUM_C_EXPORT double smoke_StaticMethods_returnDouble(double inputNumber);
_GENIUM_C_EXPORT double smoke_StaticMethods_returnIncrementedDouble(double inputNumber);
_GENIUM_C_EXPORT double smoke_StaticMethods_sumTwoDoubles(double inputNumber1, double inputNumber2);
_GENIUM_C_EXPORT int8_t smoke_StaticMethods_returnNextNumberINT8(int8_t inputNumber);
_GENIUM_C_EXPORT int8_t smoke_StaticMethods_sumTwoNumbersINT8(int8_t inputNumber1, int8_t inputNumber2);
_GENIUM_C_EXPORT int8_t smoke_StaticMethods_returnPrimeINT8();
_GENIUM_C_EXPORT uint8_t smoke_StaticMethods_returnNextNumberUINT8(uint8_t inputNumber);
_GENIUM_C_EXPORT uint8_t smoke_StaticMethods_sumTwoNumbersUINT8(uint8_t inputNumber1, uint8_t inputNumber2);
_GENIUM_C_EXPORT uint8_t smoke_StaticMethods_returnPrimeUINT8();
_GENIUM_C_EXPORT int16_t smoke_StaticMethods_returnNextNumberINT16(int16_t inputNumber);
_GENIUM_C_EXPORT int16_t smoke_StaticMethods_sumTwoNumbersINT16(int16_t inputNumber1, int16_t inputNumber2);
_GENIUM_C_EXPORT int16_t smoke_StaticMethods_returnPrimeINT16();
_GENIUM_C_EXPORT uint16_t smoke_StaticMethods_returnNextNumberUINT16(uint16_t inputNumber);
_GENIUM_C_EXPORT uint16_t smoke_StaticMethods_sumTwoNumbersUINT16(uint16_t inputNumber1, uint16_t inputNumber2);
_GENIUM_C_EXPORT uint16_t smoke_StaticMethods_returnPrimeUINT16();
_GENIUM_C_EXPORT int32_t smoke_StaticMethods_returnNextNumberINT32(int32_t inputNumber);
_GENIUM_C_EXPORT int32_t smoke_StaticMethods_sumTwoNumbersINT32(int32_t inputNumber1, int32_t inputNumber2);
_GENIUM_C_EXPORT int32_t smoke_StaticMethods_returnPrimeINT32();
_GENIUM_C_EXPORT uint32_t smoke_StaticMethods_returnNextNumberUINT32(uint32_t inputNumber);
_GENIUM_C_EXPORT uint32_t smoke_StaticMethods_sumTwoNumbersUINT32(uint32_t inputNumber1, uint32_t inputNumber2);
_GENIUM_C_EXPORT uint32_t smoke_StaticMethods_returnPrimeUINT32();
_GENIUM_C_EXPORT int64_t smoke_StaticMethods_returnNextNumberINT64(int64_t inputNumber);
_GENIUM_C_EXPORT int64_t smoke_StaticMethods_sumTwoNumbersINT64(int64_t inputNumber1, int64_t inputNumber2);
_GENIUM_C_EXPORT int64_t smoke_StaticMethods_returnPrimeINT64();
_GENIUM_C_EXPORT uint64_t smoke_StaticMethods_returnNextNumberUINT64(uint64_t inputNumber);
_GENIUM_C_EXPORT uint64_t smoke_StaticMethods_sumTwoNumbersUINT64(uint64_t inputNumber1, uint64_t inputNumber2);
_GENIUM_C_EXPORT uint64_t smoke_StaticMethods_returnPrimeUINT64();
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_returnInputString(_baseRef inputString);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_concatenateStrings(_baseRef inputString1, _baseRef inputString2);
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_returnHelloString();
_GENIUM_C_EXPORT _baseRef smoke_StaticMethods_returnEmpty();
#ifdef __cplusplus
}
#endif