#pragma once
#include "Export.h"
#include "OpaqueHandle.h"
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
namespace gluecodium
{
namespace ffi
{
struct ReverseCacheKey
{
    void* raw_pointer;
    int32_t isolate_id;
    bool
    operator==(const ReverseCacheKey& other) const {
        return raw_pointer == other.raw_pointer && isolate_id == other.isolate_id;
    }
};
struct ReverseCacheKeyHash
{
    inline size_t
    operator()(const ReverseCacheKey& key) const {
        size_t result = 7;
        result = 31 * result + reinterpret_cast<size_t>(key.raw_pointer);
        result = 31 * result + key.isolate_id;
        return result;
    }
};
extern std::unordered_map<ReverseCacheKey, uint64_t, ReverseCacheKeyHash> _reverse_cache;
extern std::mutex _reverse_cache_mutex;
uint64_t get_cached_token(void* raw_pointer, int32_t isolate_id);
void cache_token(void* raw_pointer, int32_t isolate_id, uint64_t token);
void remove_cached_token(void* raw_pointer, int32_t isolate_id);
}
}
#ifdef __cplusplus
extern "C" {
#endif
_GLUECODIUM_FFI_EXPORT uint64_t library_get_cached_token(FfiOpaqueHandle handle, int32_t isolate_id);
_GLUECODIUM_FFI_EXPORT void library_cache_token(FfiOpaqueHandle handle, int32_t isolate_id, uint64_t token);
_GLUECODIUM_FFI_EXPORT void library_uncache_token(FfiOpaqueHandle handle, int32_t isolate_id);
#ifdef __cplusplus
}
#endif
