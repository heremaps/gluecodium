//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
_GLUECODIUM_C_EXPORT void smoke_SkipFunctions_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFunctions_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipFunctions_notInJava(_baseRef input);
_GLUECODIUM_C_EXPORT float smoke_SkipFunctions_notInDart(float input);
#ifdef __cplusplus
}
#endif
