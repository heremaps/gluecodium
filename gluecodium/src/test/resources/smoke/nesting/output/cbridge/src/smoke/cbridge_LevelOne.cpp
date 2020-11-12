//
//
#include "cbridge/include/smoke/cbridge_LevelOne.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "cbridge_internal/include/WrapperCache.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/LevelOne.h"
#include "smoke/OuterClass.h"
#include "smoke/OuterInterface.h"
#include <memory>
#include <new>
#include <string>
void smoke_LevelOne_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr<::smoke::LevelOne>>(handle);
}
_baseRef smoke_LevelOne_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr<::smoke::LevelOne>>(handle)))
        : 0;
}
const void* smoke_LevelOne_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne>>(handle)->get())
        : nullptr;
}
void smoke_LevelOne_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne>>(handle)->get(), swift_pointer);
}
void smoke_LevelOne_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne>>(handle)->get());
}
void smoke_LevelOne_LevelTwo_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo>>(handle);
}
_baseRef smoke_LevelOne_LevelTwo_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo>>(handle)))
        : 0;
}
const void* smoke_LevelOne_LevelTwo_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo>>(handle)->get())
        : nullptr;
}
void smoke_LevelOne_LevelTwo_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo>>(handle)->get(), swift_pointer);
}
void smoke_LevelOne_LevelTwo_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo>>(handle)->get());
}
void smoke_LevelOne_LevelTwo_LevelThree_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(handle);
}
_baseRef smoke_LevelOne_LevelTwo_LevelThree_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(handle)))
        : 0;
}
const void* smoke_LevelOne_LevelTwo_LevelThree_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(handle)->get())
        : nullptr;
}
void smoke_LevelOne_LevelTwo_LevelThree_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(handle)->get(), swift_pointer);
}
void smoke_LevelOne_LevelTwo_LevelThree_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(handle)->get());
}
_baseRef
smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_handle( _baseRef stringField )
{
    ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour* _struct = new ( ::std::nothrow ) ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour();
    _struct->string_field = Conversion<::std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>( handle );
}
_baseRef
smoke_LevelOne_LevelTwo_LevelThree_LevelFour_create_optional_handle(_baseRef stringField)
{
    auto _struct = new ( ::std::nothrow ) ::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>( ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour( ) );
    (*_struct)->string_field = Conversion<::std::string>::toCpp( stringField );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_LevelOne_LevelTwo_LevelThree_LevelFour_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>*>( handle ) );
}
void smoke_LevelOne_LevelTwo_LevelThree_LevelFour_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>*>( handle );
}
_baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_stringField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>(handle);
    return Conversion<::std::string>::toBaseRef(struct_pointer->string_field);
}
_baseRef smoke_LevelOne_LevelTwo_LevelThree_LevelFour_fooFactory() {
    return Conversion<::smoke::LevelOne::LevelTwo::LevelThree::LevelFour>::toBaseRef(::smoke::LevelOne::LevelTwo::LevelThree::LevelFour::foo_factory());
}
_baseRef smoke_LevelOne_LevelTwo_LevelThree_foo(_baseRef _instance, _baseRef input) {
    return Conversion<::std::shared_ptr<::smoke::OuterInterface::InnerClass>>::toBaseRef(get_pointer<::std::shared_ptr<::smoke::LevelOne::LevelTwo::LevelThree>>(_instance)->get()->foo(Conversion<::std::shared_ptr<::smoke::OuterClass::InnerInterface>>::toCpp(input)));
}
