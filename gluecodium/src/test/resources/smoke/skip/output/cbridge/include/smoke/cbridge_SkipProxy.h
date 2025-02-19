//

//

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include "cbridge/include/BaseHandle.h"
#include "cbridge/include/Export.h"



_GLUECODIUM_C_EXPORT void smoke_SkipProxy_release_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT _baseRef smoke_SkipProxy_copy_handle(_baseRef handle);
_GLUECODIUM_C_EXPORT const void* smoke_SkipProxy_get_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void smoke_SkipProxy_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer);
_GLUECODIUM_C_EXPORT void smoke_SkipProxy_remove_swift_object_from_wrapper_cache(_baseRef handle);
_GLUECODIUM_C_EXPORT void* smoke_SkipProxy_get_typed(_baseRef handle);

typedef struct {
    void* swift_pointer;
    void(*release)(void* swift_pointer);
    _baseRef(*smoke_SkipProxy_notInJava)(void* swift_pointer, _baseRef input);
    float(*smoke_SkipProxy_notInDart)(void* swift_pointer, float input);
    float(*smoke_SkipProxy_notInKotlin)(void* swift_pointer, float input);
    _baseRef(*smoke_SkipProxy_skippedInJava_get)(void* swift_pointer);
    void(*smoke_SkipProxy_skippedInJava_set)(void* swift_pointer, _baseRef value);
    float(*smoke_SkipProxy_skippedInDart_get)(void* swift_pointer);
    void(*smoke_SkipProxy_skippedInDart_set)(void* swift_pointer, float value);
    float(*smoke_SkipProxy_skippedInKotlin_get)(void* swift_pointer);
    void(*smoke_SkipProxy_skippedInKotlin_set)(void* swift_pointer, float value);
} smoke_SkipProxy_FunctionTable;

_GLUECODIUM_C_EXPORT _baseRef smoke_SkipProxy_create_proxy(smoke_SkipProxy_FunctionTable functionTable);
_GLUECODIUM_C_EXPORT const void* smoke_SkipProxy_get_swift_object_from_cache(_baseRef handle);


_GLUECODIUM_C_EXPORT _baseRef smoke_SkipProxy_notInJava(_baseRef _instance, _baseRef input);

_GLUECODIUM_C_EXPORT float smoke_SkipProxy_notInDart(_baseRef _instance, float input);

_GLUECODIUM_C_EXPORT float smoke_SkipProxy_notInKotlin(_baseRef _instance, float input);


_GLUECODIUM_C_EXPORT _baseRef smoke_SkipProxy_skippedInJava_get(_baseRef _instance);


_GLUECODIUM_C_EXPORT void smoke_SkipProxy_skippedInJava_set(_baseRef _instance, _baseRef value);



_GLUECODIUM_C_EXPORT float smoke_SkipProxy_skippedInDart_get(_baseRef _instance);


_GLUECODIUM_C_EXPORT void smoke_SkipProxy_skippedInDart_set(_baseRef _instance, float value);



_GLUECODIUM_C_EXPORT float smoke_SkipProxy_skippedInKotlin_get(_baseRef _instance);


_GLUECODIUM_C_EXPORT void smoke_SkipProxy_skippedInKotlin_set(_baseRef _instance, float value);





#ifdef __cplusplus
}
#endif
