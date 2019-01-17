//
//
// Automatically generated. Do not modify. Your changes will be lost.
#include "cbridge/include/smoke/cbridge_InstanceWithStruct.h"
#include "cbridge_internal/include/BaseHandleImpl.h"
#include "smoke/InstanceWithStruct.h"
#include "smoke/SimpleInstantiable.h"
#include <memory>
#include <new>
void smoke_InstanceWithStruct_release_handle(_baseRef handle) {
    delete get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle);
}
_baseRef smoke_InstanceWithStruct_copy_handle(_baseRef handle) {
    return handle
        ? reinterpret_cast<_baseRef>(checked_pointer_copy(*get_pointer<std::shared_ptr<::smoke::InstanceWithStruct>>(handle)))
        : 0;
}
_baseRef smoke_InstanceWithStruct_InnerStruct_create_handle(int8_t value) {
    ::smoke::InstanceWithStruct::InnerStruct* _struct = new ::smoke::InstanceWithStruct::InnerStruct();
    _struct->value = value;
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_InstanceWithStruct_InnerStruct_release_handle(_baseRef handle) {
    delete get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
}
int8_t smoke_InstanceWithStruct_InnerStruct_value_get(_baseRef handle) {
    auto struct_pointer = get_pointer<::smoke::InstanceWithStruct::InnerStruct>(handle);
    return struct_pointer->value;
}
_baseRef smoke_InstanceWithStruct_StructWithInstance_create_handle(_baseRef instance, _baseRef instanceNotNull, _baseRef instanceNotNullWithComment) {
    ::smoke::InstanceWithStruct::StructWithInstance* _struct = new ::smoke::InstanceWithStruct::StructWithInstance();
    _struct->instance = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(instance);
    _struct->instance_not_null = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(instanceNotNull);
    _struct->instance_not_null_with_comment = *get_pointer<std::shared_ptr<::smoke::SimpleInstantiable>>(instanceNotNullWithComment);
    return reinterpret_cast<_baseRef>(_struct);
}
void smoke_InstanceWithStruct_StructWithInstance_release_handle(_baseRef handle) {
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