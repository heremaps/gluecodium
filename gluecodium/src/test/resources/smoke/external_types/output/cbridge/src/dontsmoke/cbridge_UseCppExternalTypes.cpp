//
//
#include "cbridge/include/dontsmoke/cbridge_UseCppExternalTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "dontsmoke/UseCppExternalTypes.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "include/ExternalTypes.h"
#include "non/Sense.h"
#include <memory>
#include <new>
void dontsmoke_UseCppExternalTypes_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::dontsmoke::UseCppExternalTypes >>(handle);
}
_baseRef dontsmoke_UseCppExternalTypes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::dontsmoke::UseCppExternalTypes >>(handle)))
        : 0;
}
const void* dontsmoke_UseCppExternalTypes_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::dontsmoke::UseCppExternalTypes >>(handle)->get())
        : nullptr;
}
void dontsmoke_UseCppExternalTypes_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::dontsmoke::UseCppExternalTypes >>(handle)->get(), swift_pointer);
}
void dontsmoke_UseCppExternalTypes_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::dontsmoke::UseCppExternalTypes >>(handle)->get());
}
void dontsmoke_UseCppExternalTypes_useStruct(_baseRef input) {
    return ::dontsmoke::UseCppExternalTypes::use_struct(Conversion<::fire::SomeVeryExternalStruct>::toCpp(input));
}
void dontsmoke_UseCppExternalTypes_useEnum(uint32_t input) {
    return ::dontsmoke::UseCppExternalTypes::use_enum(static_cast<::smoke::Enums::External_Enum>(input));
}
void dontsmoke_UseCppExternalTypes_useClass(_baseRef input) {
    return ::dontsmoke::UseCppExternalTypes::use_class(Conversion<::std::shared_ptr< ::smoke::ClassWithOverloads >>::toCpp(input));
}
