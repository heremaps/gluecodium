//
//
#include "cbridge\include\smoke\cbridge_ClassWithStructWithSkipLambdaInPlatform.h"
#include "cbridge_internal\include\BaseHandleImpl.h"
#include "cbridge_internal\include\TypeInitRepository.h"
#include "cbridge_internal\include\WrapperCache.h"
#include "smoke\ClassWithStructWithSkipLambdaInPlatform.h"
#include <cstdint>
#include <memory>
#include <new>
#include <optional>
void smoke_ClassWithStructWithSkipLambdaInPlatform_release_handle(_baseRef handle) {
    delete get_pointer<::std::shared_ptr< ::smoke::ClassWithStructWithSkipLambdaInPlatform >>(handle);
}
_baseRef smoke_ClassWithStructWithSkipLambdaInPlatform_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<::std::shared_ptr< ::smoke::ClassWithStructWithSkipLambdaInPlatform >>(handle)))
        : 0;
}
const void* smoke_ClassWithStructWithSkipLambdaInPlatform_get_swift_object_from_wrapper_cache(_baseRef handle) {
    return handle
        ? ::gluecodium::get_wrapper_cache().get_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ClassWithStructWithSkipLambdaInPlatform >>(handle)->get())
        : nullptr;
}
void smoke_ClassWithStructWithSkipLambdaInPlatform_cache_swift_object_wrapper(_baseRef handle, const void* swift_pointer) {
    if (!handle) return;
    ::gluecodium::get_wrapper_cache().cache_wrapper(get_pointer<::std::shared_ptr< ::smoke::ClassWithStructWithSkipLambdaInPlatform >>(handle)->get(), swift_pointer);
}
void smoke_ClassWithStructWithSkipLambdaInPlatform_remove_swift_object_from_wrapper_cache(_baseRef handle) {
    if (!::gluecodium::WrapperCache::is_alive) return;
    ::gluecodium::get_wrapper_cache().remove_cached_wrapper(get_pointer<::std::shared_ptr< ::smoke::ClassWithStructWithSkipLambdaInPlatform >>(handle)->get());
}
_baseRef
smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_handle( int32_t intField )
{
    ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform* _struct = new ( ::std::nothrow ) ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform();
    _struct->int_field = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>( handle );
}
_baseRef
smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_create_optional_handle(int32_t intField)
{
    auto _struct = new ( ::std::nothrow ) std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>( ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform( ) );
    (*_struct)->int_field = intField;
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*>( handle ) );
}
void smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>*>( handle );
}
int32_t smoke_ClassWithStructWithSkipLambdaInPlatform_SkipLambdaInPlatform_intField_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::ClassWithStructWithSkipLambdaInPlatform::SkipLambdaInPlatform>(handle);
    return struct_pointer->int_field;
}