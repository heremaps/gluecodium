//
//
#include "cbridge/include/smoke/cbridge_DurationExternal.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "core/duration.h"
#include <cstdint>
#include <memory>
#include <new>
#include <optional>
_baseRef
smoke_DurationExternal_create_handle( uint64_t value )
{
    auto _value = value;
    std::chrono::duration<uint64_t, std::ratio<1,1000>>* _struct = new ( ::std::nothrow ) std::chrono::duration<uint64_t, std::ratio<1,1000>>( _value );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_DurationExternal_release_handle( _baseRef handle )
{
    delete get_pointer<std::chrono::duration<uint64_t, std::ratio<1,1000>>>( handle );
}
_baseRef
smoke_DurationExternal_create_optional_handle(uint64_t value)
{
    auto _value = value;
    auto _struct = new ( ::std::nothrow ) std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>( std::chrono::duration<uint64_t, std::ratio<1,1000>>( _value ) );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_DurationExternal_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>*>( handle ) );
}
void smoke_DurationExternal_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<std::optional<std::chrono::duration<uint64_t, std::ratio<1,1000>>>*>( handle );
}
uint64_t smoke_DurationExternal_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const std::chrono::duration<uint64_t, std::ratio<1,1000>>>(handle);
    return struct_pointer->count();
}
