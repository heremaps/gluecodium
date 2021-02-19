#include "ffi_smoke_UseDartExternalTypes.h"
#include "ConversionBase.h"
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
