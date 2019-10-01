//
//
#pragma once
#ifdef __cplusplus
extern "C" {
#endif
#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"
#include "cbridge/include/StringHandle.h"
#include "cbridge/include/smoke/cbridge_OuterClass.h"
#include "cbridge/include/smoke/cbridge_OuterInterface.h"
#include <stdint.h>
_GLUECODIUM_C_EXPORT void smoke_LevelOne_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_LevelOne_LevelTwo_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_copy_handle(_baseRef handle);
typedef uint32_t smoke_LevelOne_LevelTwo_LevelThree_LevelFourEnum;
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle(_baseRef stringField);
_GLUECODIUM_C_EXPORT void smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_optional_handle(_baseRef stringField);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_unwrap_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_optional_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_stringField_get(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory();
_GLUECODIUM_C_EXPORT void smoke_LevelOne_LevelTwo_LevelThree_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_LevelOne_LevelTwo_LevelThree_foo(_baseRef _instance, _baseRef input);
#ifdef __cplusplus
}
#endif
