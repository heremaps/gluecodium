#include "ffi_smoke_UseDartExternalTypes.h"
#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "IsolateContext.h"
#include "smoke/CompressionState.h"
#include "smoke/DartColor.h"
#include "smoke/DartSeason.h"
#include "smoke/Rectangle.h"
#include "smoke/UseDartExternalTypes.h"
#include <memory>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_UseDartExternalTypes_rectangleRoundTrip__Rectangle(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::Rectangle>::toFfi(
        ::smoke::UseDartExternalTypes::rectangle_round_trip(
            gluecodium::ffi::Conversion<::smoke::Rectangle>::toCpp(input)
        )
    );
}
uint32_t
library_smoke_UseDartExternalTypes_compressionStateRoundTrip__CompressionState(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::CompressionState>::toFfi(
        ::smoke::UseDartExternalTypes::compression_state_round_trip(
            gluecodium::ffi::Conversion<::smoke::CompressionState>::toCpp(input)
        )
    );
}
FfiOpaqueHandle
library_smoke_UseDartExternalTypes_colorRoundTrip__DartColor(int32_t _isolate_id, FfiOpaqueHandle input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::DartColor>::toFfi(
        ::smoke::UseDartExternalTypes::color_round_trip(
            gluecodium::ffi::Conversion<::smoke::DartColor>::toCpp(input)
        )
    );
}
uint32_t
library_smoke_UseDartExternalTypes_seasonRoundTrip__DartSeason(int32_t _isolate_id, uint32_t input) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<::smoke::DartSeason>::toFfi(
        ::smoke::UseDartExternalTypes::season_round_trip(
            gluecodium::ffi::Conversion<::smoke::DartSeason>::toCpp(input)
        )
    );
}
// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_UseDartExternalTypes_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<::smoke::UseDartExternalTypes>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_UseDartExternalTypes_release_handle(handle);
}
void
library_smoke_UseDartExternalTypes_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_UseDartExternalTypes_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}
FfiOpaqueHandle
library_smoke_UseDartExternalTypes_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::UseDartExternalTypes>(
            *reinterpret_cast<std::shared_ptr<::smoke::UseDartExternalTypes>*>(handle)
        )
    );
}
void
library_smoke_UseDartExternalTypes_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::UseDartExternalTypes>*>(handle);
}
#ifdef __cplusplus
}
#endif
