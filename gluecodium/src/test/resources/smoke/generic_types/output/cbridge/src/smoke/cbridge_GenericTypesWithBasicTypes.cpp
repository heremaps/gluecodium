//
//
#include "cbridge/include/smoke/cbridge_GenericTypesWithBasicTypes.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "cbridge_internal/include/TypeInitRepository.h"
#include "gluecodium/Optional.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/GenericTypesWithBasicTypes.h"
#include <memory>
#include <new>
#include <unordered_map>
#include <unordered_set>
#include <vector>
void smoke_GenericTypesWithBasicTypes_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(handle);
}
_baseRef smoke_GenericTypesWithBasicTypes_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(handle)))
        : 0;
}
_baseRef
smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_handle( _baseRef numbersList, _baseRef numbersMap, _baseRef numbersSet )
{
    ::smoke::GenericTypesWithBasicTypes::StructWithGenerics* _struct = new ( std::nothrow ) ::smoke::GenericTypesWithBasicTypes::StructWithGenerics();
    _struct->numbers_list = Conversion<std::vector<uint8_t>>::toCpp( numbersList );
    _struct->numbers_map = Conversion<std::unordered_map<uint8_t, std::string>>::toCpp( numbersMap );
    _struct->numbers_set = Conversion<std::unordered_set<uint8_t>>::toCpp( numbersSet );
    return reinterpret_cast<_baseRef>( _struct );
}
void
smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_handle( _baseRef handle )
{
    delete get_pointer<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>( handle );
}
_baseRef
smoke_GenericTypesWithBasicTypes_StructWithGenerics_create_optional_handle(_baseRef numbersList, _baseRef numbersMap, _baseRef numbersSet)
{
    auto _struct = new ( std::nothrow ) ::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>( ::smoke::GenericTypesWithBasicTypes::StructWithGenerics( ) );
    (*_struct)->numbers_list = Conversion<std::vector<uint8_t>>::toCpp( numbersList );
    (*_struct)->numbers_map = Conversion<std::unordered_map<uint8_t, std::string>>::toCpp( numbersMap );
    (*_struct)->numbers_set = Conversion<std::unordered_set<uint8_t>>::toCpp( numbersSet );
    return reinterpret_cast<_baseRef>( _struct );
}
_baseRef
smoke_GenericTypesWithBasicTypes_StructWithGenerics_unwrap_optional_handle( _baseRef handle )
{
    return reinterpret_cast<_baseRef>( &**reinterpret_cast<::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>*>( handle ) );
}
void smoke_GenericTypesWithBasicTypes_StructWithGenerics_release_optional_handle(_baseRef handle) {
    delete reinterpret_cast<::gluecodium::optional<::smoke::GenericTypesWithBasicTypes::StructWithGenerics>*>( handle );
}
_baseRef smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersList_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::GenericTypesWithBasicTypes::StructWithGenerics>(handle);
return Conversion<std::vector<uint8_t>>::toBaseRef(struct_pointer->numbers_list);
}
_baseRef smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersMap_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::GenericTypesWithBasicTypes::StructWithGenerics>(handle);
return Conversion<std::unordered_map<uint8_t, std::string>>::toBaseRef(struct_pointer->numbers_map);
}
_baseRef smoke_GenericTypesWithBasicTypes_StructWithGenerics_numbersSet_get(_baseRef handle) {
    auto struct_pointer = get_pointer<const ::smoke::GenericTypesWithBasicTypes::StructWithGenerics>(handle);
return Conversion<std::unordered_set<uint8_t>>::toBaseRef(struct_pointer->numbers_set);
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithList(_baseRef _instance, _baseRef input) {
    return Conversion<std::vector<int32_t>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_list(Conversion<std::vector<int32_t>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithMap(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<int32_t, bool>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_map(Conversion<std::unordered_map<int32_t, bool>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithSet(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_set<int32_t>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_set(Conversion<std::unordered_set<int32_t>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias(_baseRef _instance, _baseRef input) {
    return Conversion<std::vector<std::string>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_list_type_alias(Conversion<std::vector<std::string>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_map<std::string, std::string>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_map_type_alias(Conversion<std::unordered_map<std::string, std::string>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias(_baseRef _instance, _baseRef input) {
    return Conversion<std::unordered_set<std::string>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->method_with_set_type_alias(Conversion<std::unordered_set<std::string>>::toCpp(input)));
}
_baseRef smoke_GenericTypesWithBasicTypes_listProperty_get(_baseRef _instance) {
    return Conversion<std::vector<float>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->get_list_property());
}
void smoke_GenericTypesWithBasicTypes_listProperty_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->set_list_property(Conversion<std::vector<float>>::toCpp(newValue));
}
_baseRef smoke_GenericTypesWithBasicTypes_mapProperty_get(_baseRef _instance) {
    return Conversion<std::unordered_map<float, double>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->get_map_property());
}
void smoke_GenericTypesWithBasicTypes_mapProperty_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->set_map_property(Conversion<std::unordered_map<float, double>>::toCpp(newValue));
}
_baseRef smoke_GenericTypesWithBasicTypes_setProperty_get(_baseRef _instance) {
    return Conversion<std::unordered_set<float>>::toBaseRef(get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->get_set_property());
}
void smoke_GenericTypesWithBasicTypes_setProperty_set(_baseRef _instance, _baseRef newValue) {
    return get_pointer<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>>(_instance)->get()->set_set_property(Conversion<std::unordered_set<float>>::toCpp(newValue));
}
