//
//
#include "cbridge/include/smoke/cbridge_UseOptimizedListStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "gluecodium/VectorHash.h"
#include "smoke/UnreasonablyLazyClass.h"
#include "smoke/UseOptimizedListStruct.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <new>
#include <optional>
#include <vector>
_baseRef
smoke_UseOptimizedListStruct_create_handle( _baseRef structs, _baseRef classes )
{
    auto _structs = Conversion<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>::toCpp( structs );
    auto _classes = Conversion<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>::toCpp( classes );
    ::smoke::UseOptimizedListStruct* _struct = new ( ::std::nothrow ) ::smoke::UseOptimizedListStruct( _structs, _classes );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_UseOptimizedListStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::UseOptimizedListStruct>( handle );
}
_baseRef
smoke_UseOptimizedListStruct_create_optional_handle(_baseRef structs, _baseRef classes)
{
    auto _structs = Conversion<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>::toCpp( structs );
    auto _classes = Conversion<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>::toCpp( classes );
    auto _struct = new ( ::std::nothrow ) std::optional<::smoke::UseOptimizedListStruct>( ::smoke::UseOptimizedListStruct( _structs, _classes ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_UseOptimizedListStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<::smoke::UseOptimizedListStruct>*>( handle ) );
}
void smoke_UseOptimizedListStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<::smoke::UseOptimizedListStruct>*>( handle );
}
_baseRef smoke_UseOptimizedListStruct_structs_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::UseOptimizedListStruct>(handle);
    return reinterpret_cast<_baseRef>(
        new (std::nothrow) std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>(
            new (std::nothrow) ::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >(struct_pointer->structs)
        )
    );
}
_baseRef smoke_UseOptimizedListStruct_classes_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::UseOptimizedListStruct>(handle);
    return reinterpret_cast<_baseRef>(
        new (std::nothrow) std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>(
            new (std::nothrow) ::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >(struct_pointer->classes)
        )
    );
}
