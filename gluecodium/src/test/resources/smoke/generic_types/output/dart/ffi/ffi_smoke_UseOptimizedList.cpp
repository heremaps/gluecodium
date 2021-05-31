#include "ffi_smoke_UseOptimizedList.h"
#include "ConversionBase.h"
#include "IsolateContext.h"
#include "gluecodium/VectorHash.h"
#include "smoke/UnreasonablyLazyClass.h"
#include "smoke/UseOptimizedList.h"
#include "smoke/VeryBigStruct.h"
#include <memory>
#include <vector>
#include <memory>
#include <new>
#ifdef __cplusplus
extern "C" {
#endif
FfiOpaqueHandle
library_smoke_UseOptimizedList_fetchTheBigOnes(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>>(
            new (std::nothrow) std::vector<::std::shared_ptr< ::smoke::VeryBigStruct >>(
                ::smoke::UseOptimizedList::fetch_the_big_ones()
            )
        )
    );
}
FfiOpaqueHandle
library_smoke_UseOptimizedList_lazyOnes_get(int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<std::vector<std::shared_ptr<::smoke::UnreasonablyLazyClass>>>(
            new (std::nothrow) std::vector<std::shared_ptr<::smoke::UnreasonablyLazyClass>>(
                ::smoke::UseOptimizedList::get_lazy_ones()
            )
        )
    );
}
FfiOpaqueHandle
library_smoke_UseOptimizedList_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<::smoke::UseOptimizedList>(
            *reinterpret_cast<std::shared_ptr<::smoke::UseOptimizedList>*>(handle)
        )
    );
}
void
library_smoke_UseOptimizedList_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<::smoke::UseOptimizedList>*>(handle);
}
#ifdef __cplusplus
}
#endif
