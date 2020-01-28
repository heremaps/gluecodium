#include "NullableHandles.h"
#include "ConversionBase.h"
#include "gluecodium/Optional.h"
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
Byte_create_handle_nullable(int8_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int8_t>(
            (value)
        )
    );
}
void
Byte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int8_t>*>(handle);
}
int8_t
Byte_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int8_t>*>(handle)
    );
}
FfiOpaqueHandle
UByte_create_handle_nullable(uint8_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint8_t>(
            (value)
        )
    );
}
void
UByte_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint8_t>*>(handle);
}
uint8_t
UByte_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint8_t>*>(handle)
    );
}
FfiOpaqueHandle
Short_create_handle_nullable(int16_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int16_t>(
            (value)
        )
    );
}
void
Short_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int16_t>*>(handle);
}
int16_t
Short_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int16_t>*>(handle)
    );
}
FfiOpaqueHandle
UShort_create_handle_nullable(uint16_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint16_t>(
            (value)
        )
    );
}
void
UShort_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint16_t>*>(handle);
}
uint16_t
UShort_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint16_t>*>(handle)
    );
}
FfiOpaqueHandle
Int_create_handle_nullable(int32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int32_t>(
            (value)
        )
    );
}
void
Int_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int32_t>*>(handle);
}
int32_t
Int_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int32_t>*>(handle)
    );
}
FfiOpaqueHandle
UInt_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint32_t>(
            (value)
        )
    );
}
void
UInt_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint32_t>*>(handle);
}
uint32_t
UInt_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint32_t>*>(handle)
    );
}
FfiOpaqueHandle
Long_create_handle_nullable(int64_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<int64_t>(
            (value)
        )
    );
}
void
Long_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<int64_t>*>(handle);
}
int64_t
Long_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<int64_t>*>(handle)
    );
}
FfiOpaqueHandle
ULong_create_handle_nullable(uint64_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<uint64_t>(
            (value)
        )
    );
}
void
ULong_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<uint64_t>*>(handle);
}
uint64_t
ULong_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<uint64_t>*>(handle)
    );
}
FfiOpaqueHandle
Float_create_handle_nullable(float value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<float>(
            (value)
        )
    );
}
void
Float_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<float>*>(handle);
}
float
Float_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<float>*>(handle)
    );
}
FfiOpaqueHandle
Double_create_handle_nullable(double value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<double>(
            (value)
        )
    );
}
void
Double_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<double>*>(handle);
}
double
Double_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<double>*>(handle)
    );
}
FfiOpaqueHandle
Boolean_create_handle_nullable(bool value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<bool>(
            (value)
        )
    );
}
void
Boolean_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<bool>*>(handle);
}
bool
Boolean_get_value_nullable(FfiOpaqueHandle handle)
{
    return (
        **reinterpret_cast<gluecodium::optional<bool>*>(handle)
    );
}
FfiOpaqueHandle
String_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::string>(
            gluecodium::ffi::Conversion<std::string>::toCpp(value)
        )
    );
}
void
String_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::string>*>(handle);
}
FfiOpaqueHandle
String_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::string>*>(handle)
    );
}
FfiOpaqueHandle
Blob_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
        )
    );
}
void
Blob_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>*>(handle);
}
FfiOpaqueHandle
Blob_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::shared_ptr<std::vector<uint8_t>>>*>(handle)
    );
}
FfiOpaqueHandle
Date_create_handle_nullable(uint64_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) gluecodium::optional<std::chrono::system_clock::time_point>(
            gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toCpp(value)
        )
    );
}
void
Date_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<gluecodium::optional<std::chrono::system_clock::time_point>*>(handle);
}
uint64_t
Date_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<std::chrono::system_clock::time_point>::toFfi(
        **reinterpret_cast<gluecodium::optional<std::chrono::system_clock::time_point>*>(handle)
    );
}
#ifdef __cplusplus
}
#endif
