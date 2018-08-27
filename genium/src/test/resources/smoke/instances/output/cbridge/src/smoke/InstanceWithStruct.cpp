//
//
// Automatically generated. Do not modify. Your changes will be lost.

#include "cbridge/include/smoke/InstanceWithStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/InstanceWithStruct.h"
#include "smoke/SimpleInstantiableOne.h"
#include <memory>
#include <new>

void smoke_InstanceWithStruct_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle);
}
_baseRef smoke_InstanceWithStruct_InnerStruct_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::InnerStruct() );
}
void smoke_InstanceWithStruct_InnerStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
}
int8_t smoke_InstanceWithStruct_InnerStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
    return struct_pointer->value;
}
void smoke_InstanceWithStruct_InnerStruct_value_set(_baseRef handle, int8_t value) {
    get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle)->value = value;
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_create() {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::StructWithInstance() );
}
void smoke_InstanceWithStruct_StructWithInstance_release(_baseRef handle) {
    delete get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance) );
}
void smoke_InstanceWithStruct_StructWithInstance_instance_set(_baseRef handle, _baseRef instance) {
    get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle)->instance = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instance);
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance_not_null) );
}
void smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_set(_baseRef handle, _baseRef instanceNotNull) {
    get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle)->instance_not_null = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instanceNotNull);
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance_not_null_with_comment) );
}
void smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_set(_baseRef handle, _baseRef instanceNotNullWithComment) {
    get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle)->instance_not_null_with_comment = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instanceNotNullWithComment);
}
_baseRef smoke_InstanceWithStruct_innerStructMethod(_baseRef _instance, _baseRef inputStruct) {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::InnerStruct(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->inner_struct_method(*get_pointer<::smoke::InstanceWithStruct::InnerStruct>(inputStruct))) );
}
_baseRef smoke_InstanceWithStruct_structWithInstanceMethod(_baseRef _instance, _baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::StructWithInstance(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->struct_with_instance_method(*get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(input))) );
}
