//
//
// Automatically generated. Do not modify. Your changes will be lost.
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
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
} smoke_Constructors_create_withError_result;
void smoke_Constructors_release_handle(_baseRef handle);
_baseRef smoke_Constructors_copy_handle(_baseRef handle);
_baseRef smoke_Constructors_create_noArgs();
_baseRef smoke_Constructors_create_copyCtor(_baseRef other);
_baseRef smoke_Constructors_create_twoArgs(_baseRef foo, uint64_t bar);
smoke_Constructors_create_withError_result smoke_Constructors_create_withError(_baseRef input);
_baseRef smoke_Constructors_create_withArray(_baseRef input);
#ifdef __cplusplus
}
#endif