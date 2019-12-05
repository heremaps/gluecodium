#include "ffi_smoke_Structs.h"
#include "ConversionBase.h"
#include "foo/Bar.h"
#include "foo/Bazz.h"
#include "gluecodium/VectorHash.h"
#include "non/Sense.h"
#include "smoke/Structs.h"
#include "smoke/TypeCollection.h"
#include <cstdint>
#include <memory>
#include <string>
#include <vector>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
smoke_Structs_swapPointCoordinates__Point(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        smoke::Structs::swap_point_coordinates(
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Structs_returnAllTypesStruct__AllTypesStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toFfi(
        smoke::Structs::return_all_types_struct(
            gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
smoke_Structs_getExternalStruct() {
    return gluecodium::ffi::Conversion<smoke::Structs::ExternalStruct>::toFfi(
        smoke::Structs::get_external_struct()
    );
}
FfiOpaqueHandle
smoke_Structs_getAnotherExternalStruct() {
    return gluecodium::ffi::Conversion<smoke::Structs::AnotherExternalStruct>::toFfi(
        smoke::Structs::get_another_external_struct()
    );
}
FfiOpaqueHandle
smoke_Structs_getYetAnotherExternalStruct() {
    return gluecodium::ffi::Conversion<smoke::Structs::YetAnotherExternalStruct>::toFfi(
        smoke::Structs::get_yet_another_external_struct()
    );
}
FfiOpaqueHandle
smoke_Structs_createPoint__Double_Double(double x, double y) {
    return gluecodium::ffi::Conversion<::Point>::toFfi(
        smoke::Structs::create_point(
            gluecodium::ffi::Conversion<double>::toCpp(x),
            gluecodium::ffi::Conversion<double>::toCpp(y)
        )
    );
}
FfiOpaqueHandle
smoke_Structs_modifyAllTypesStruct__AllTypesStruct(FfiOpaqueHandle input) {
    return gluecodium::ffi::Conversion<::AllTypesStruct>::toFfi(
        smoke::Structs::modify_all_types_struct(
            gluecodium::ffi::Conversion<::AllTypesStruct>::toCpp(input)
        )
    );
}
  FfiOpaqueHandle
smoke_Structs_Point_create_handle(double x, double y) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::Point(
            gluecodium::ffi::Conversion<double>::toCpp(x),
            gluecodium::ffi::Conversion<double>::toCpp(y)
        ));
}
void
smoke_Structs_Point_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::Point*>(handle);
}
double
smoke_Structs_Point_get_field_x(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::Point*>(handle)->x
    );
}
double
smoke_Structs_Point_get_field_y(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::Point*>(handle)->y
    );
}
  FfiOpaqueHandle
smoke_Structs_Line_create_handle(FfiOpaqueHandle a, FfiOpaqueHandle b) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::Line(
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(a),
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(b)
        ));
}
void
smoke_Structs_Line_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::Line*>(handle);
}
FfiOpaqueHandle
smoke_Structs_Line_get_field_a(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::Line*>(handle)->a
    );
}
FfiOpaqueHandle
smoke_Structs_Line_get_field_b(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::Line*>(handle)->b
    );
}
  FfiOpaqueHandle
smoke_Structs_AllTypesStruct_create_handle(int8_t int8Field, uint8_t uint8Field, int16_t int16Field, uint16_t uint16Field, int32_t int32Field, uint32_t uint32Field, int64_t int64Field, uint64_t uint64Field, float floatField, double doubleField, FfiOpaqueHandle stringField, bool booleanField, FfiOpaqueHandle bytesField, FfiOpaqueHandle pointField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::AllTypesStruct(
            gluecodium::ffi::Conversion<int8_t>::toCpp(int8Field),
            gluecodium::ffi::Conversion<uint8_t>::toCpp(uint8Field),
            gluecodium::ffi::Conversion<int16_t>::toCpp(int16Field),
            gluecodium::ffi::Conversion<uint16_t>::toCpp(uint16Field),
            gluecodium::ffi::Conversion<int32_t>::toCpp(int32Field),
            gluecodium::ffi::Conversion<uint32_t>::toCpp(uint32Field),
            gluecodium::ffi::Conversion<int64_t>::toCpp(int64Field),
            gluecodium::ffi::Conversion<uint64_t>::toCpp(uint64Field),
            gluecodium::ffi::Conversion<float>::toCpp(floatField),
            gluecodium::ffi::Conversion<double>::toCpp(doubleField),
            gluecodium::ffi::Conversion<std::string>::toCpp(stringField),
            gluecodium::ffi::Conversion<bool>::toCpp(booleanField),
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(bytesField),
            gluecodium::ffi::Conversion<smoke::Structs::Point>::toCpp(pointField)
        ));
}
void
smoke_Structs_AllTypesStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle);
}
int8_t
smoke_Structs_AllTypesStruct_get_field_int8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int8_field
    );
}
uint8_t
smoke_Structs_AllTypesStruct_get_field_uint8Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint8_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint8_field
    );
}
int16_t
smoke_Structs_AllTypesStruct_get_field_int16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int16_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int16_field
    );
}
uint16_t
smoke_Structs_AllTypesStruct_get_field_uint16Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint16_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint16_field
    );
}
int32_t
smoke_Structs_AllTypesStruct_get_field_int32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int32_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int32_field
    );
}
uint32_t
smoke_Structs_AllTypesStruct_get_field_uint32Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint32_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint32_field
    );
}
int64_t
smoke_Structs_AllTypesStruct_get_field_int64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int64_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->int64_field
    );
}
uint64_t
smoke_Structs_AllTypesStruct_get_field_uint64Field(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<uint64_t>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->uint64_field
    );
}
float
smoke_Structs_AllTypesStruct_get_field_floatField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<float>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->float_field
    );
}
double
smoke_Structs_AllTypesStruct_get_field_doubleField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->double_field
    );
}
FfiOpaqueHandle
smoke_Structs_AllTypesStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->string_field
    );
}
bool
smoke_Structs_AllTypesStruct_get_field_booleanField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<bool>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->boolean_field
    );
}
FfiOpaqueHandle
smoke_Structs_AllTypesStruct_get_field_bytesField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->bytes_field
    );
}
FfiOpaqueHandle
smoke_Structs_AllTypesStruct_get_field_pointField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::Point>::toFfi(
        reinterpret_cast<smoke::Structs::AllTypesStruct*>(handle)->point_field
    );
}
  FfiOpaqueHandle
smoke_Structs_ExternalStruct_create_handle(FfiOpaqueHandle stringField, FfiOpaqueHandle externalStringField, FfiOpaqueHandle externalArrayField, FfiOpaqueHandle externalStructField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::ExternalStruct(
            gluecodium::ffi::Conversion<std::string>::toCpp(stringField),
            gluecodium::ffi::Conversion<std::string>::toCpp(externalStringField),
            gluecodium::ffi::Conversion<std::vector<int8_t>>::toCpp(externalArrayField),
            gluecodium::ffi::Conversion<smoke::Structs::AnotherExternalStruct>::toCpp(externalStructField)
        ));
}
void
smoke_Structs_ExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::ExternalStruct*>(handle);
}
FfiOpaqueHandle
smoke_Structs_ExternalStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->string_field
    );
}
FfiOpaqueHandle
smoke_Structs_ExternalStruct_get_field_externalStringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->external_string_field
    );
}
FfiOpaqueHandle
smoke_Structs_ExternalStruct_get_field_externalArrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::vector<int8_t>>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->external_array_field
    );
}
FfiOpaqueHandle
smoke_Structs_ExternalStruct_get_field_externalStructField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::AnotherExternalStruct>::toFfi(
        reinterpret_cast<smoke::Structs::ExternalStruct*>(handle)->external_struct_field
    );
}
  FfiOpaqueHandle
smoke_Structs_AnotherExternalStruct_create_handle(int8_t intField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::AnotherExternalStruct(
            gluecodium::ffi::Conversion<int8_t>::toCpp(intField)
        ));
}
void
smoke_Structs_AnotherExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::AnotherExternalStruct*>(handle);
}
int8_t
smoke_Structs_AnotherExternalStruct_get_field_intField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<int8_t>::toFfi(
        reinterpret_cast<smoke::Structs::AnotherExternalStruct*>(handle)->int_field
    );
}
  FfiOpaqueHandle
smoke_Structs_YetAnotherExternalStruct_create_handle(FfiOpaqueHandle stringField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::YetAnotherExternalStruct(
            gluecodium::ffi::Conversion<std::string>::toCpp(stringField)
        ));
}
void
smoke_Structs_YetAnotherExternalStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::YetAnotherExternalStruct*>(handle);
}
FfiOpaqueHandle
smoke_Structs_YetAnotherExternalStruct_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::YetAnotherExternalStruct*>(handle)->string_field
    );
}
  FfiOpaqueHandle
smoke_Structs_NestingImmutableStruct_create_handle(FfiOpaqueHandle structField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::NestingImmutableStruct(
            gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toCpp(structField)
        ));
}
void
smoke_Structs_NestingImmutableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::NestingImmutableStruct*>(handle);
}
FfiOpaqueHandle
smoke_Structs_NestingImmutableStruct_get_field_structField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::AllTypesStruct>::toFfi(
        reinterpret_cast<smoke::Structs::NestingImmutableStruct*>(handle)->struct_field
    );
}
  FfiOpaqueHandle
smoke_Structs_DoubleNestingImmutableStruct_create_handle(FfiOpaqueHandle nestingStructField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::DoubleNestingImmutableStruct(
            gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toCpp(nestingStructField)
        ));
}
void
smoke_Structs_DoubleNestingImmutableStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::DoubleNestingImmutableStruct*>(handle);
}
FfiOpaqueHandle
smoke_Structs_DoubleNestingImmutableStruct_get_field_nestingStructField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::NestingImmutableStruct>::toFfi(
        reinterpret_cast<smoke::Structs::DoubleNestingImmutableStruct*>(handle)->nesting_struct_field
    );
}
  FfiOpaqueHandle
smoke_Structs_StructWithArrayOfImmutable_create_handle(FfiOpaqueHandle arrayField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::StructWithArrayOfImmutable(
            gluecodium::ffi::Conversion<smoke::Structs::ArrayOfImmutable>::toCpp(arrayField)
        ));
}
void
smoke_Structs_StructWithArrayOfImmutable_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::StructWithArrayOfImmutable*>(handle);
}
FfiOpaqueHandle
smoke_Structs_StructWithArrayOfImmutable_get_field_arrayField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<smoke::Structs::ArrayOfImmutable>::toFfi(
        reinterpret_cast<smoke::Structs::StructWithArrayOfImmutable*>(handle)->array_field
    );
}
  FfiOpaqueHandle
smoke_Structs_ImmutableStructWithCppAccessors_create_handle(FfiOpaqueHandle stringField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::ImmutableStructWithCppAccessors(
            gluecodium::ffi::Conversion<std::string>::toCpp(stringField)
        ));
}
void
smoke_Structs_ImmutableStructWithCppAccessors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::ImmutableStructWithCppAccessors*>(handle);
}
FfiOpaqueHandle
smoke_Structs_ImmutableStructWithCppAccessors_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::ImmutableStructWithCppAccessors*>(handle)->get_string_field()
    );
}
  FfiOpaqueHandle
smoke_Structs_MutableStructWithCppAccessors_create_handle(FfiOpaqueHandle stringField) {
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) smoke::Structs::MutableStructWithCppAccessors(
            gluecodium::ffi::Conversion<std::string>::toCpp(stringField)
        ));
}
void
smoke_Structs_MutableStructWithCppAccessors_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::Structs::MutableStructWithCppAccessors*>(handle);
}
FfiOpaqueHandle
smoke_Structs_MutableStructWithCppAccessors_get_field_stringField(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        reinterpret_cast<smoke::Structs::MutableStructWithCppAccessors*>(handle)->get_string_field()
    );
}
#ifdef __cplusplus
}
#endif
