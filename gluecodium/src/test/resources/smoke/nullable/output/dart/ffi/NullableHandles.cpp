#include "NullableHandles.h"
#include "ConversionBase.h"
#include "gluecodium/Locale.h"
#include "gluecodium/Optional.h"
#include <chrono>
#include <memory>
#include <new>
#include <string>
#include <vector>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_Byte_create_handle_nullable(int8_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int8_t>(
            (value)
        )
    );
}
void
library_Byte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int8_t>*>(handle);
}
int8_t
library_Byte_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int8_t>*>(handle)
    );
}
FfiOpaqueHandle
library_UByte_create_handle_nullable(uint8_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint8_t>(
            (value)
        )
    );
}
void
library_UByte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint8_t>*>(handle);
}
uint8_t
library_UByte_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint8_t>*>(handle)
    );
}
FfiOpaqueHandle
library_Short_create_handle_nullable(int16_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int16_t>(
            (value)
        )
    );
}
void
library_Short_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int16_t>*>(handle);
}
int16_t
library_Short_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int16_t>*>(handle)
    );
}
FfiOpaqueHandle
library_UShort_create_handle_nullable(uint16_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint16_t>(
            (value)
        )
    );
}
void
library_UShort_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint16_t>*>(handle);
}
uint16_t
library_UShort_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint16_t>*>(handle)
    );
}
FfiOpaqueHandle
library_Int_create_handle_nullable(int32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int32_t>(
            (value)
        )
    );
}
void
library_Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int32_t>*>(handle);
}
int32_t
library_Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int32_t>*>(handle)
    );
}
FfiOpaqueHandle
library_UInt_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint32_t>(
            (value)
        )
    );
}
void
library_UInt_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint32_t>*>(handle);
}
uint32_t
library_UInt_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint32_t>*>(handle)
    );
}
FfiOpaqueHandle
library_Long_create_handle_nullable(int64_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int64_t>(
            (value)
        )
    );
}
void
library_Long_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int64_t>*>(handle);
}
int64_t
library_Long_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int64_t>*>(handle)
    );
}
FfiOpaqueHandle
library_ULong_create_handle_nullable(uint64_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint64_t>(
            (value)
        )
    );
}
void
library_ULong_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint64_t>*>(handle);
}
uint64_t
library_ULong_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint64_t>*>(handle)
    );
}
FfiOpaqueHandle
library_Float_create_handle_nullable(float value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<float>(
            (value)
        )
    );
}
void
library_Float_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<float>*>(handle);
}
float
library_Float_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<float>*>(handle)
    );
}
FfiOpaqueHandle
library_Double_create_handle_nullable(double value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<double>(
            (value)
        )
    );
}
void
library_Double_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<double>*>(handle);
}
double
library_Double_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<double>*>(handle)
    );
}
FfiOpaqueHandle
library_Boolean_create_handle_nullable(bool value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<bool>(
            (value)
        )
    );
}
void
library_Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<bool>*>(handle);
}
bool
library_Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<bool>*>(handle)
    );
}
FfiOpaqueHandle
library_String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::string>(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        )
    );
}
void
library_String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::string>*>(handle);
}
FfiOpaqueHandle
library_String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::string>*>(handle)
    );
}
FfiOpaqueHandle
library_Blob_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
        )
    );
}
void
library_Blob_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>*>(handle);
}
FfiOpaqueHandle
library_Blob_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>*>(handle)
    );
}
FfiOpaqueHandle
library_Locale_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<gluecodium::Locale>(
            gluecodium::ffi::Conversion<gluecodium::Locale>::toCpp(value)
        )
    );
}
void
library_Locale_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<gluecodium::Locale>*>(handle);
}
FfiOpaqueHandle
library_Locale_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<gluecodium::Locale>::toFfi(
        **reinterpret_cast<gluecodium::optional<gluecodium::Locale>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
