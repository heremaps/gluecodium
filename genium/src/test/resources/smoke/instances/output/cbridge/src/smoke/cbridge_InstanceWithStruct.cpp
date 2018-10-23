//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_InstanceWithStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/InstanceWithStruct.h"
#include "smoke/SimpleInstantiableOne.h"
#include <memory>
#include <new>
void smoke_InstanceWithStruct_release(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle);
}
_baseRef smoke_InstanceWithStruct_InnerStruct_create(int8_t value) {
    ::smoke::InstanceWithStruct::InnerStruct* _struct = new ::smoke::InstanceWithStruct::InnerStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_InstanceWithStruct_InnerStruct_release(_baseRef handle) {
    delete get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
}
int8_t smoke_InstanceWithStruct_InnerStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
    return struct_pointer->value;
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_create(_baseRef instance, _baseRef instanceNotNull, _baseRef instanceNotNullWithComment) {
    ::smoke::InstanceWithStruct::StructWithInstance* _struct = new ::smoke::InstanceWithStruct::StructWithInstance();
    _struct->instance = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instance);
    _struct->instance_not_null = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instanceNotNull);
    _struct->instance_not_null_with_comment = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiableOne>>(instanceNotNullWithComment);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_InstanceWithStruct_StructWithInstance_release(_baseRef handle) {
    delete get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instance_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance) );
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instanceNotNull_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance_not_null) );
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_instanceNotNullWithComment_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(handle);
    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->instance_not_null_with_comment) );
}
_baseRef smoke_InstanceWithStruct_innerStructMethod(_baseRef _instance, _baseRef inputStruct) {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::InnerStruct(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->inner_struct_method(*get_pointer<::smoke::InstanceWithStruct::InnerStruct>(inputStruct))) );
}
_baseRef smoke_InstanceWithStruct_structWithInstanceMethod(_baseRef _instance, _baseRef input) {
    return reinterpret_cast<_baseRef>( new ::smoke::InstanceWithStruct::StructWithInstance(get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(_instance)->get()->struct_with_instance_method(*get_pointer<::smoke::InstanceWithStruct::StructWithInstance>(input))) );
}
