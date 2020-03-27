#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <stdint.h>
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_BasicTypes_stringFunction__String(int32_t _isolate_id, FfiOpaqueHandle input);
_GLUECODIUM_FFI_EXPORT bool library_smoke_BasicTypes_boolFunction__Boolean(int32_t _isolate_id, bool input);
_GLUECODIUM_FFI_EXPORT float library_smoke_BasicTypes_floatFunction__Float(int32_t _isolate_id, float input);
_GLUECODIUM_FFI_EXPORT double library_smoke_BasicTypes_doubleFunction__Double(int32_t _isolate_id, double input);
_GLUECODIUM_FFI_EXPORT int8_t library_smoke_BasicTypes_byteFunction__Byte(int32_t _isolate_id, int8_t input);
_GLUECODIUM_FFI_EXPORT int16_t library_smoke_BasicTypes_shortFunction__Short(int32_t _isolate_id, int16_t input);
_GLUECODIUM_FFI_EXPORT int32_t library_smoke_BasicTypes_intFunction__Int(int32_t _isolate_id, int32_t input);
_GLUECODIUM_FFI_EXPORT int64_t library_smoke_BasicTypes_longFunction__Long(int32_t _isolate_id, int64_t input);
_GLUECODIUM_FFI_EXPORT uint8_t library_smoke_BasicTypes_ubyteFunction__UByte(int32_t _isolate_id, uint8_t input);
_GLUECODIUM_FFI_EXPORT uint16_t library_smoke_BasicTypes_ushortFunction__UShort(int32_t _isolate_id, uint16_t input);
_GLUECODIUM_FFI_EXPORT uint32_t library_smoke_BasicTypes_uintFunction__UInt(int32_t _isolate_id, uint32_t input);
_GLUECODIUM_FFI_EXPORT uint64_t library_smoke_BasicTypes_ulongFunction__ULong(int32_t _isolate_id, uint64_t input);
_GLUECODIUM_FFI_EXPORT FfiOpaqueHandle library_smoke_BasicTypes_copy_handle(FfiOpaqueHandle handle);
_GLUECODIUM_FFI_EXPORT void library_smoke_BasicTypes_release_handle(FfiOpaqueHandle handle);
#ifdef __cplusplus
}
#endif
