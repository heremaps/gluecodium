#include "InstanceCache.h"
#include <memory>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>
namespace
{
using InstanceCacheKey = void*;
std::unordered_map<InstanceCacheKey, Dart_WeakPersistentHandle> _instance_cache{};
std::mutex _instance_cache_mutex{};
std::unordered_map<int32_t, std::vector<Dart_WeakPersistentHandle>> _deletion_queue{};
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
// "Private" function, call only when mutex is locked.
void
library_process_deletion_queue(int32_t isolate_id) {
    auto iter = _deletion_queue.find(isolate_id);
    if (iter == _deletion_queue.end()) return;
    for (const auto& weak_handle: iter->second) {
        Dart_DeleteWeakPersistentHandle_DL(weak_handle);
    }
    _deletion_queue.erase(iter);
}
void
library_cache_dart_handle_by_raw_pointer(void* raw_pointer, int32_t isolate_id, Dart_Handle dart_handle) {
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    _instance_cache[raw_pointer] = Dart_NewWeakPersistentHandle_DL(dart_handle, NULL, 0, &library_nop_finalizer);
    library_process_deletion_queue(isolate_id);
}
void
library_uncache_dart_handle_by_raw_pointer(void* raw_pointer, int32_t isolate_id) {
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    auto iter = _instance_cache.find(raw_pointer);
    if (iter != _instance_cache.end()) {
        // No Dart API calls can be made if this is called from a finalizer, see
        // https://github.com/dart-lang/sdk/blob/2.12.0/runtime/include/dart_api.h#L472
        // So weak handle deletion needs to be postponed and called from a "normal" (non-finalizer) context.
        _deletion_queue[isolate_id].push_back(iter->second);
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
library_cache_dart_handle(FfiOpaqueHandle handle, int32_t isolate_id, Dart_Handle dart_handle) {
    auto raw_pointer = library_raw_pointer_from_opaque_handle(handle);
    library_cache_dart_handle_by_raw_pointer(raw_pointer, isolate_id, dart_handle);
}
#ifdef __cplusplus
}
#endif
