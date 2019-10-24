//
//
#include "Optional.h"
#include "TypeRepository.h"
#include "cbridge/include/namerules/cbridge_NameRules.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "namerules/NameRules.h"
#include <memory>
#include <new>
#include <vector>
void namerules_NameRules_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::namerules::NameRules>>(handle);
}
_baseRef namerules_NameRules_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::namerules::NameRules>>(handle)))
        : 0;
}
_baseRef
namerules_NameRules_ExampleStruct_create_handle( double iValue, _baseRef iIntValue )
{
    ::namerules::NameRules::ExampleStruct* _struct = new ( std::nothrow ) ::namerules::NameRules::ExampleStruct();
    _struct->m_value = iValue;
    _struct->m_int_value = Conversion<std::vector<int64_t>>::toCpp( iIntValue );
    return reinterpret_cast<_baseRef>( _struct );
}
void
namerules_NameRules_ExampleStruct_release_handle( _baseRef handle )
{
    delete get_pointer<::namerules::NameRules::ExampleStruct>( handle );
}
_baseRef
namerules_NameRules_ExampleStruct_create_optional_handle(double iValue, _baseRef iIntValue)
{
    auto _struct = new ( std::nothrow ) ::optional<::namerules::NameRules::ExampleStruct>( ::namerules::NameRules::ExampleStruct( ) );
    (*_struct)->m_value = iValue;
    (*_struct)->m_int_value = Conversion<std::vector<int64_t>>::toCpp( iIntValue );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
namerules_NameRules_ExampleStruct_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::optional<::namerules::NameRules::ExampleStruct>*>( handle ) );
}
void namerules_NameRules_ExampleStruct_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::optional<::namerules::NameRules::ExampleStruct>*>( handle );
}
double namerules_NameRules_ExampleStruct_iValue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::namerules::NameRules::ExampleStruct>(handle);
return struct_pointer->m_value;
}
_baseRef namerules_NameRules_ExampleStruct_iIntValue_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::namerules::NameRules::ExampleStruct>(handle);
return Conversion<std::vector<int64_t>>::toBaseRef(struct_pointer->m_int_value);
}
_baseRef namerules_NameRules_create() {
    return Conversion<std::shared_ptr<::namerules::NameRules>>::toBaseRef(::namerules::NameRules::create());
}
namerules_NameRules_someMethod_result namerules_NameRules_someMethod(_baseRef _instance, _baseRef someArgument) {
    auto&& RESULT = get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->someMethod(Conversion<::namerules::NameRules::ExampleStruct>::toCpp(someArgument));
    if (RESULT.has_value()) {
        return {true, .returned_value = RESULT.unsafe_value()};
    } else {
        return {false, .error_code = static_cast< namerules_NameRules_ExampleErrorCode >(RESULT.error().value())};
    }
}
uint32_t namerules_NameRules_intProperty_get(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->retrieve_int_property();
}
void namerules_NameRules_intProperty_set(_baseRef _instance, uint32_t newValue) {
    return get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->STORE_INT_PROPERTY_NOW(newValue);
}
bool namerules_NameRules_booleanProperty_get(_baseRef _instance) {
    return get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->really_boolean_property();
}
void namerules_NameRules_booleanProperty_set(_baseRef _instance, bool newValue) {
    return get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->STORE_BOOLEAN_PROPERTY_NOW(newValue);
}
_baseRef namerules_NameRules_structProperty_get(_baseRef _instance) {
    return Conversion<::namerules::NameRules::ExampleStruct>::toBaseRef(get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->retrieve_struct_property());
}
void namerules_NameRules_structProperty_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::namerules::NameRules>>(_instance)->get()->STORE_STRUCT_PROPERTY_NOW(Conversion<::namerules::NameRules::ExampleStruct>::toCpp(newValue));
}
