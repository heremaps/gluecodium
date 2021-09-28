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
std::vector<Dart_WeakPersistentHandle>
library_store_handle_and_get_deletion_queue_locked(
    void* raw_pointer, int32_t isolate_id, Dart_WeakPersistentHandle new_handle
) {
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    _instance_cache[raw_pointer] = new_handle;
    auto iter = _deletion_queue.find(isolate_id);
    if (iter == _deletion_queue.end()) return {};
    auto result = std::move(iter->second);
    _deletion_queue.erase(iter);
    return result;
}
Dart_WeakPersistentHandle
library_get_handle_locked(void* raw_pointer)
{
    const std::lock_guard<std::mutex> lock(_instance_cache_mutex);
    auto iter = _instance_cache.find(raw_pointer);
    return (iter != _instance_cache.end()) ? iter->second : nullptr;
}
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
library_cache_dart_handle_by_raw_pointer(void* raw_pointer, int32_t isolate_id, Dart_Handle dart_handle) {
    auto new_handle = Dart_NewWeakPersistentHandle_DL(dart_handle, NULL, 0, &library_nop_finalizer);
    auto pending_for_deletion =
        library_store_handle_and_get_deletion_queue_locked(raw_pointer, isolate_id, new_handle);
    // Process deletion queue
    for (const auto& weak_handle: pending_for_deletion) {
        Dart_DeleteWeakPersistentHandle_DL(weak_handle);
    }
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
    auto cached_handle = library_get_handle_locked(raw_pointer);
    return (cached_handle != nullptr) ? Dart_HandleFromWeakPersistent_DL(cached_handle) : null_handle;
}
void
library_cache_dart_handle(FfiOpaqueHandle handle, int32_t isolate_id, Dart_Handle dart_handle) {
    auto raw_pointer = library_raw_pointer_from_opaque_handle(handle);
    library_cache_dart_handle_by_raw_pointer(raw_pointer, isolate_id, dart_handle);
}
#ifdef __cplusplus
}
#endif
