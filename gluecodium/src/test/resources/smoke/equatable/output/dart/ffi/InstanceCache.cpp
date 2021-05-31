#include "InstanceCache.h"
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
namespace
{
using InstanceCacheKey = void*;
std::unordered_map<InstanceCacheKey, Dart_WeakPersistentHandle> _instance_cache{};
std::mutex _instance_cache_mutex{};
}
#ifdef __cplusplus
extern "C" {
#endif
void
library_nop_finalizer(void*, void*) {}
void*
library_raw_pointer_from_opaque_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<std::shared_ptr<void>*>(handle)->get();
}
void
library_cache_dart_handle_by_raw_pointer(void* raw_pointer, Dart_Handle dart_handle) {
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    _instance_cache[raw_pointer] = Dart_NewWeakPersistentHandle_DL(dart_handle, NULL, 0, &library_nop_finalizer);
}
void
library_uncache_dart_handle_by_raw_pointer(void* raw_pointer) {
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    auto iter = _instance_cache.find(raw_pointer);
    if (iter != _instance_cache.end()) {
        Dart_DeleteWeakPersistentHandle_DL(iter->second);
        _instance_cache.erase(iter);
    }
}
Dart_Handle
library_get_cached_dart_handle(FfiOpaqueHandle handle, Dart_Handle null_handle) {
    auto raw_pointer = library_raw_pointer_from_opaque_handle(handle);
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    auto iter = _instance_cache.find(raw_pointer);
    return (iter != _instance_cache.end()) ? Dart_HandleFromWeakPersistent_DL(iter->second) : null_handle;
}
void
library_cache_dart_handle(FfiOpaqueHandle handle, Dart_Handle dart_handle) {
    auto raw_pointer = library_raw_pointer_from_opaque_handle(handle);
    library_cache_dart_handle_by_raw_pointer(raw_pointer, dart_handle);
}
void
library_uncache_dart_handle(FfiOpaqueHandle handle) {
    auto raw_pointer = library_raw_pointer_from_opaque_handle(handle);
    library_uncache_dart_handle_by_raw_pointer(raw_pointer);
}
#ifdef __cplusplus
}
#endif
