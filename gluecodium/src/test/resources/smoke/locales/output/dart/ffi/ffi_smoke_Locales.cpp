#include "ffi_smoke_Locales.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "gluecodium/Locale.h"
#include "smoke/Locales.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_Locales_localeMethod__Locale(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Locales>>::toCpp(_self)).locale_method(
            gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_Locales_localeProperty_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Locales>>::toCpp(_self)).get_locale_property()
    );
}
void
library_smoke_Locales_localeProperty_set__Locale(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
            (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::Locales>>::toCpp(_self)).set_locale_property(
            gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(value)
        );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_Locales_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::Locales>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_Locales_release_handle(handle);
}
void
library_smoke_Locales_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_Locales_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_Locales_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::Locales>(
            *reinterpret_cast<std::shared_ptr<smoke::Locales>*>(handle)
        )
    );
}
void
library_smoke_Locales_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::Locales>*>(handle);
}
FfiOpaqueHandle
library_smoke_Locales_LocaleStruct_create_handle(FfiOpaqueHandle localeField) {
    auto _result = new (std::nothrow) smoke::Locales::LocaleStruct();
    _result->locale_field = gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(localeField);
    return reinterpret_cast<FfiOpaqueHandle>(_result);
}
void
library_smoke_Locales_LocaleStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Locales::LocaleStruct*>(handle);
}
FfiOpaqueHandle
library_smoke_Locales_LocaleStruct_get_field_localeField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        reinterpret_cast<smoke::Locales::LocaleStruct*>(handle)->locale_field
    );
}
FfiOpaqueHandle
library_smoke_Locales_LocaleStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<smoke::Locales::LocaleStruct>(
            gluecodium::ffi::Conversion<smoke::Locales::LocaleStruct>::toCpp(value)
        )
    );
}
void
library_smoke_Locales_LocaleStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<smoke::Locales::LocaleStruct>*>(handle);
}
FfiOpaqueHandle
library_smoke_Locales_LocaleStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::Locales::LocaleStruct>::toFfi(
        **reinterpret_cast<gluecodium::optional<smoke::Locales::LocaleStruct>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
