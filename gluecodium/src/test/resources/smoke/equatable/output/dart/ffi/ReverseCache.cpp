#include "ReverseCache.h"
namespace gluecodium
{
namespace ffi
{
std::unordered_map<ReverseCacheKey, uint64_t, ReverseCacheKeyHash> _reverse_cache{};
std::mutex _reverse_cache_mutex{};
uint64_t
get_cached_token(void* raw_pointer, int32_t isolate_id) {
    const std::lock_guard<std::mutex> lock(_reverse_cache_mutex);
    auto iter = _reverse_cache.find({raw_pointer, isolate_id});
    return (iter != _reverse_cache.end()) ? iter->second : 0;
}
void
cache_token(void* raw_pointer, int32_t isolate_id, uint64_t token) {
    const std::lock_guard<std::mutex> lock(_reverse_cache_mutex);
    _reverse_cache[{raw_pointer, isolate_id}] = token;
}
void
remove_cached_token(void* raw_pointer, int32_t isolate_id) {
    const std::lock_guard<std::mutex> lock(_reverse_cache_mutex);
    _reverse_cache.erase({raw_pointer, isolate_id});
}
}
}
#ifdef __cplusplus
extern "C" {
#endif
uint64_t
library_get_cached_token(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<void>*>(handle);
    return gluecodium::ffi::get_cached_token(ptr_ptr->get(), isolate_id);
}
void
library_cache_token(FfiOpaqueHandle handle, int32_t isolate_id, uint64_t token) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<void>*>(handle);
    gluecodium::ffi::cache_token(ptr_ptr->get(), isolate_id, token);
}
void
library_uncache_token(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<void>*>(handle);
    gluecodium::ffi::remove_cached_token(ptr_ptr->get(), isolate_id);
}
#ifdef __cplusplus
}
#endif
