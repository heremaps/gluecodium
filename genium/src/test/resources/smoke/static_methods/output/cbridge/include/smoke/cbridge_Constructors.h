//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include <stdbool.h>
#include <stdint.h>
typedef uint32_t smoke_Constructors_ErrorEnum;
typedef struct {
    bool has_value;
    union {
        smoke_Constructors_ErrorEnum error_code;
        _baseRef returned_value;
    };
} smoke_Constructors_create_3_result;
_GENIUM_C_EXPORT void smoke_Constructors_release_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Constructors_copy_handle(_baseRef handle);
_GENIUM_C_EXPORT _baseRef smoke_Constructors_create_0();
_GENIUM_C_EXPORT _baseRef smoke_Constructors_create_1(_baseRef other);
_GENIUM_C_EXPORT _baseRef smoke_Constructors_create_2(_baseRef foo, uint64_t bar);
_GENIUM_C_EXPORT smoke_Constructors_create_3_result smoke_Constructors_create_3(_baseRef input);
_GENIUM_C_EXPORT _baseRef smoke_Constructors_create_4(_baseRef input);
#ifdef __cplusplus
}
#endif
