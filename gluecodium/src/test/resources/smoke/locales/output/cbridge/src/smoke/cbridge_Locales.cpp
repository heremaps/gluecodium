//
//
#include "cbridge/include/smoke/cbridge_Locales.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Locale.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/Locales.h"
#include <memory>
#include <new>
void smoke_Locales_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::Locales>>(handle);
}
_baseRef smoke_Locales_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::Locales>>(handle)))
        : 0;
}
const void* smoke_Locales_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Locales>>(handle)->get())
        : nullptr;
}
void smoke_Locales_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<std::shared_ptr<::smoke::Locales>>(handle)->get(), swift_pointer);
}
void smoke_Locales_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<std::shared_ptr<::smoke::Locales>>(handle)->get());
}
_baseRef
smoke_Locales_LocaleStruct_create_handle( _baseRef localeField )
{
    ::smoke::Locales::LocaleStruct* _struct = new ( std::nothrow ) ::smoke::Locales::LocaleStruct();
    _struct->locale_field = Conversion<gluecodium::Locale>::toCpp( localeField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_Locales_LocaleStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::Locales::LocaleStruct>( handle );
}
_baseRef
smoke_Locales_LocaleStruct_create_optional_handle(_baseRef localeField)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::Locales::LocaleStruct>( ::smoke::Locales::LocaleStruct( ) );
    (*_struct)->locale_field = Conversion<gluecodium::Locale>::toCpp( localeField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_Locales_LocaleStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::Locales::LocaleStruct>*>( handle ) );
}
void smoke_Locales_LocaleStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::Locales::LocaleStruct>*>( handle );
}
_baseRef smoke_Locales_LocaleStruct_localeField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::Locales::LocaleStruct>(handle);
    return Conversion<gluecodium::Locale>::toBaseRef(struct_pointer->locale_field);
}
_baseRef smoke_Locales_localeMethod(_baseRef _instance, _baseRef input) {
    return Conversion<gluecodium::Locale>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Locales>>(_instance)->get()->locale_method(Conversion<gluecodium::Locale>::toCpp(input)));
}
_baseRef smoke_Locales_localeProperty_get(_baseRef _instance) {
    return Conversion<gluecodium::Locale>::toBaseRef(get_pointer<std::shared_ptr<::smoke::Locales>>(_instance)->get()->get_locale_property());
}
void smoke_Locales_localeProperty_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::Locales>>(_instance)->get()->set_locale_property(Conversion<gluecodium::Locale>::toCpp(newValue));
}
