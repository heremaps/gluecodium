#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle smoke_BasicTypes_stringFunction__String(FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT bool smoke_BasicTypes_boolFunction__Boolean(bool input);
_GLUECODIUM_FFI_EXPORT float smoke_BasicTypes_floatFunction__Float(float input);
_GLUECODIUM_FFI_EXPORT double smoke_BasicTypes_doubleFunction__Double(double input);
_GLUECODIUM_FFI_EXPORT int8_t smoke_BasicTypes_byteFunction__Byte(int8_t input);
_GLUECODIUM_FFI_EXPORT int16_t smoke_BasicTypes_shortFunction__Short(int16_t input);
_GLUECODIUM_FFI_EXPORT int32_t smoke_BasicTypes_intFunction__Int(int32_t input);
_GLUECODIUM_FFI_EXPORT int64_t smoke_BasicTypes_longFunction__Long(int64_t input);
_GLUECODIUM_FFI_EXPORT uint8_t smoke_BasicTypes_ubyteFunction__UByte(uint8_t input);
_GLUECODIUM_FFI_EXPORT uint16_t smoke_BasicTypes_ushortFunction__UShort(uint16_t input);
_GLUECODIUM_FFI_EXPORT uint32_t smoke_BasicTypes_uintFunction__UInt(uint32_t input);
_GLUECODIUM_FFI_EXPORT uint64_t smoke_BasicTypes_ulongFunction__ULong(uint64_t input);
#ifdef __cplusplus
}
#endif
