
#include "ffi_smoke_ListenerWithProperties.h"

#include "ConversionBase.h"
#include "InstanceCache.h"
#include "FinalizerData.h"
#include "CallbacksQueue.h"
#include "IsolateContext.h"
#include "ProxyCache.h"
#include "gluecodium/TypeRepository.h"
#include "gluecodium/UnorderedMapHash.h"
#include "gluecodium/VectorHash.h"
#include "smoke/CalculationResult.h"
#include "smoke/ListenerWithProperties.h"
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>
#include <memory>
#include <new>
#include <thread>

class smoke_ListenerWithProperties_Proxy : public smoke::ListenerWithProperties {
public:
    smoke_ListenerWithProperties_Proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s, FfiOpaqueHandle p2g, FfiOpaqueHandle p2s, FfiOpaqueHandle p3g, FfiOpaqueHandle p3s, FfiOpaqueHandle p4g, FfiOpaqueHandle p4s, FfiOpaqueHandle p5g, FfiOpaqueHandle p5s, FfiOpaqueHandle p6g, FfiOpaqueHandle p6s)
        : token(token), isolate_id(isolate_id), dart_persistent_handle(Dart_NewPersistentHandle_DL(dart_handle)), f_close_callbacks(close_callbacks), isolate_handle(Dart_CurrentIsolate_DL()), isolate_thread_id(std::this_thread::get_id()), p0g(p0g), p0s(p0s), p1g(p1g), p1s(p1s), p2g(p2g), p2s(p2s), p3g(p3g), p3s(p3s), p4g(p4g), p4s(p4s), p5g(p5g), p5s(p5s), p6g(p6g), p6s(p6s) {
        library_cache_dart_handle_by_raw_pointer(this, isolate_id, dart_handle);
    }

    ~smoke_ListenerWithProperties_Proxy() {
        gluecodium::ffi::remove_cached_proxy(token, isolate_id, "smoke_ListenerWithProperties");

        auto raw_pointer_local = this;
        auto isolate_id_local = isolate_id;
        auto dart_persistent_handle_local = dart_persistent_handle;
        auto f_close_callbacks_local = f_close_callbacks;
        auto deleter = [raw_pointer_local, isolate_id_local, dart_persistent_handle_local, f_close_callbacks_local]() {
            library_uncache_dart_handle_by_raw_pointer(raw_pointer_local, isolate_id_local);
            Dart_DeletePersistentHandle_DL(dart_persistent_handle_local);
            (*reinterpret_cast<void (*)()>(f_close_callbacks_local))();
        };

        if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            deleter();
        } else {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, deleter);
        }
    }

    smoke_ListenerWithProperties_Proxy(const smoke_ListenerWithProperties_Proxy&) = delete;
    smoke_ListenerWithProperties_Proxy& operator=(const smoke_ListenerWithProperties_Proxy&) = delete;


    std::string
    get_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p0g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::string>::toCpp(_result_handle);
        delete reinterpret_cast<std::string*>(_result_handle);
        return _result;
    }

    void
    set_message(const std::string& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p0s))(
            gluecodium::ffi::Conversion<std::string>::toFfi(value)
        ); });
    }
    std::shared_ptr<smoke::CalculationResult>
    get_packed_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p1g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<smoke::CalculationResult>*>(_result_handle);
        return _result;
    }

    void
    set_packed_message(const std::shared_ptr<smoke::CalculationResult>& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p1s))(
            gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toFfi(value)
        ); });
    }
    smoke::ListenerWithProperties::ResultStruct
    get_structured_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p2g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toCpp(_result_handle);
        delete reinterpret_cast<smoke::ListenerWithProperties::ResultStruct*>(_result_handle);
        return _result;
    }

    void
    set_structured_message(const smoke::ListenerWithProperties::ResultStruct& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p2s))(
            gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toFfi(value)
        ); });
    }
    smoke::ListenerWithProperties::ResultEnum
    get_enumerated_message() const override {
        uint32_t _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint32_t*)>(p3g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toCpp(_result_handle);
        ;
        return _result;
    }

    void
    set_enumerated_message(const smoke::ListenerWithProperties::ResultEnum value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(uint32_t)>(p3s))(
            gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toFfi(value)
        ); });
    }
    std::vector<std::string>
    get_arrayed_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p4g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(_result_handle);
        delete reinterpret_cast<std::vector<std::string>*>(_result_handle);
        return _result;
    }

    void
    set_arrayed_message(const std::vector<std::string>& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p4s))(
            gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(value)
        ); });
    }
    std::unordered_map<std::string, double>
    get_mapped_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p5g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(_result_handle);
        delete reinterpret_cast<std::unordered_map<std::string, double>*>(_result_handle);
        return _result;
    }

    void
    set_mapped_message(const std::unordered_map<std::string, double>& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p5s))(
            gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(value)
        ); });
    }
    std::shared_ptr<std::vector<uint8_t>>
    get_buffered_message() const override {
        FfiOpaqueHandle _result_handle;
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle*)>(p6g))(&_result_handle); });
        auto _result = gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(_result_handle);
        delete reinterpret_cast<std::shared_ptr<std::vector<uint8_t>>*>(_result_handle);
        return _result;
    }

    void
    set_buffered_message(const std::shared_ptr<std::vector<uint8_t>>& value) override {
        dispatch([&]() { (*reinterpret_cast<bool (*)(FfiOpaqueHandle)>(p6s))(
            gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(value)
        ); });
    }

private:
    const uint64_t token;
    const int32_t isolate_id;
    const Dart_PersistentHandle dart_persistent_handle;
    const FfiOpaqueHandle f_close_callbacks;
    const Dart_Isolate isolate_handle;
    const std::thread::id isolate_thread_id;
    const FfiOpaqueHandle p0g;
    const FfiOpaqueHandle p0s;
    const FfiOpaqueHandle p1g;
    const FfiOpaqueHandle p1s;
    const FfiOpaqueHandle p2g;
    const FfiOpaqueHandle p2s;
    const FfiOpaqueHandle p3g;
    const FfiOpaqueHandle p3s;
    const FfiOpaqueHandle p4g;
    const FfiOpaqueHandle p4s;
    const FfiOpaqueHandle p5g;
    const FfiOpaqueHandle p5s;
    const FfiOpaqueHandle p6g;
    const FfiOpaqueHandle p6s;

    inline void dispatch(std::function<void()>&& callback) const
    {
        if (isolate_thread_id != std::this_thread::get_id()) {
            gluecodium::ffi::cbqm.enqueueCallback(isolate_id, std::move(callback)).wait();
        } else if (gluecodium::ffi::IsolateContext::is_current(isolate_id)) {
            callback();
        } else {
            Dart_EnterIsolate_DL(isolate_handle);
            callback();
            Dart_ExitIsolate_DL();
        }
    }
};


#ifdef __cplusplus
extern "C" {
#endif





FfiOpaqueHandle
library_smoke_ListenerWithProperties_message_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::string>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_message()
    );
}



void
library_smoke_ListenerWithProperties_message_set__String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_message(
        gluecodium::ffi::Conversion<std::string>::toCpp(value)
    );
}




FfiOpaqueHandle
library_smoke_ListenerWithProperties_packedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_packed_message()
    );
}



void
library_smoke_ListenerWithProperties_packedMessage_set__CalculationResult(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_packed_message(
        gluecodium::ffi::Conversion<std::shared_ptr<smoke::CalculationResult>>::toCpp(value)
    );
}




FfiOpaqueHandle
library_smoke_ListenerWithProperties_structuredMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_structured_message()
    );
}



void
library_smoke_ListenerWithProperties_structuredMessage_set__ResultStruct(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_structured_message(
        gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toCpp(value)
    );
}




uint32_t
library_smoke_ListenerWithProperties_enumeratedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_enumerated_message()
    );
}



void
library_smoke_ListenerWithProperties_enumeratedMessage_set__ResultEnum(FfiOpaqueHandle _self, int32_t _isolate_id, uint32_t value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_enumerated_message(
        gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toCpp(value)
    );
}




FfiOpaqueHandle
library_smoke_ListenerWithProperties_arrayedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::vector<std::string>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_arrayed_message()
    );
}



void
library_smoke_ListenerWithProperties_arrayedMessage_set__ListOf_String(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_arrayed_message(
        gluecodium::ffi::Conversion<std::vector<std::string>>::toCpp(value)
    );
}




FfiOpaqueHandle
library_smoke_ListenerWithProperties_mappedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_mapped_message()
    );
}



void
library_smoke_ListenerWithProperties_mappedMessage_set__MapOf_String_to_Double(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_mapped_message(
        gluecodium::ffi::Conversion<std::unordered_map<std::string, double>>::toCpp(value)
    );
}




FfiOpaqueHandle
library_smoke_ListenerWithProperties_bufferedMessage_get(FfiOpaqueHandle _self, int32_t _isolate_id) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    return gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toFfi(
        (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).get_buffered_message()
    );
}



void
library_smoke_ListenerWithProperties_bufferedMessage_set__Blob(FfiOpaqueHandle _self, int32_t _isolate_id, FfiOpaqueHandle value) {
    gluecodium::ffi::IsolateContext _isolate_context(_isolate_id);
    (*gluecodium::ffi::Conversion<std::shared_ptr<smoke::ListenerWithProperties>>::toCpp(_self)).set_buffered_message(
        gluecodium::ffi::Conversion<std::shared_ptr<std::vector<uint8_t>>>::toCpp(value)
    );
}

















// "Private" finalizer, not exposed to be callable from Dart.
void
library_smoke_ListenerWithProperties_finalizer(FfiOpaqueHandle handle, int32_t isolate_id) {
    auto ptr_ptr = reinterpret_cast<std::shared_ptr<smoke::ListenerWithProperties>*>(handle);
    library_uncache_dart_handle_by_raw_pointer(ptr_ptr->get(), isolate_id);
    library_smoke_ListenerWithProperties_release_handle(handle);
}

void
library_smoke_ListenerWithProperties_register_finalizer(FfiOpaqueHandle ffi_handle, int32_t isolate_id, Dart_Handle dart_handle) {
    FinalizerData* data = new (std::nothrow) FinalizerData{ffi_handle, isolate_id, &library_smoke_ListenerWithProperties_finalizer};
    Dart_NewFinalizableHandle_DL(dart_handle, data, sizeof data, &library_execute_finalizer);
}

FfiOpaqueHandle
library_smoke_ListenerWithProperties_copy_handle(FfiOpaqueHandle handle) {
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::shared_ptr<smoke::ListenerWithProperties>(
            *reinterpret_cast<std::shared_ptr<smoke::ListenerWithProperties>*>(handle)
        )
    );
}

void
library_smoke_ListenerWithProperties_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<std::shared_ptr<smoke::ListenerWithProperties>*>(handle);
}


FfiOpaqueHandle
library_smoke_ListenerWithProperties_create_proxy(uint64_t token, int32_t isolate_id, Dart_Handle dart_handle, FfiOpaqueHandle close_callbacks, FfiOpaqueHandle p0g, FfiOpaqueHandle p0s, FfiOpaqueHandle p1g, FfiOpaqueHandle p1s, FfiOpaqueHandle p2g, FfiOpaqueHandle p2s, FfiOpaqueHandle p3g, FfiOpaqueHandle p3s, FfiOpaqueHandle p4g, FfiOpaqueHandle p4s, FfiOpaqueHandle p5g, FfiOpaqueHandle p5s, FfiOpaqueHandle p6g, FfiOpaqueHandle p6s) {
    auto cached_proxy = gluecodium::ffi::get_cached_proxy<smoke_ListenerWithProperties_Proxy>(token, isolate_id, "smoke_ListenerWithProperties");
    std::shared_ptr<smoke_ListenerWithProperties_Proxy>* proxy_ptr;
    if (cached_proxy) {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ListenerWithProperties_Proxy>(cached_proxy);
        (*reinterpret_cast<void (*)()>(close_callbacks))();
    } else {
        proxy_ptr = new (std::nothrow) std::shared_ptr<smoke_ListenerWithProperties_Proxy>(
            new (std::nothrow) smoke_ListenerWithProperties_Proxy(token, isolate_id, dart_handle, close_callbacks, p0g, p0s, p1g, p1s, p2g, p2s, p3g, p3s, p4g, p4s, p5g, p5s, p6g, p6s)
        );
        gluecodium::ffi::cache_proxy(token, isolate_id, "smoke_ListenerWithProperties", *proxy_ptr);
    }

    return reinterpret_cast<FfiOpaqueHandle>(proxy_ptr);
}



FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_create_handle(double result) {
    auto _result = new (std::nothrow) smoke::ListenerWithProperties::ResultStruct();


    _result->result = gluecodium::ffi::Conversion<double>::toCpp(result);

    return reinterpret_cast<FfiOpaqueHandle>(_result);
}


void
library_smoke_ListenerWithProperties_ResultStruct_release_handle(FfiOpaqueHandle handle) {
    delete reinterpret_cast<smoke::ListenerWithProperties::ResultStruct*>(handle);
}


double
library_smoke_ListenerWithProperties_ResultStruct_get_field_result(FfiOpaqueHandle handle) {
    return gluecodium::ffi::Conversion<double>::toFfi(
        reinterpret_cast<smoke::ListenerWithProperties::ResultStruct*>(handle)->result
    );
}



FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_create_handle_nullable(FfiOpaqueHandle value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::ListenerWithProperties::ResultStruct>(
            gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toCpp(value)
        )
    );
}

void
library_smoke_ListenerWithProperties_ResultStruct_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::ListenerWithProperties::ResultStruct>*>(handle);
}

FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultStruct_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultStruct>::toFfi(
        **reinterpret_cast<std::optional<smoke::ListenerWithProperties::ResultStruct>*>(handle)
    );
}



FfiOpaqueHandle
library_smoke_ListenerWithProperties_ResultEnum_create_handle_nullable(uint32_t value)
{
    return reinterpret_cast<FfiOpaqueHandle>(
        new (std::nothrow) std::optional<smoke::ListenerWithProperties::ResultEnum>(
            gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toCpp(value)
        )
    );
}

void
library_smoke_ListenerWithProperties_ResultEnum_release_handle_nullable(FfiOpaqueHandle handle)
{
    delete reinterpret_cast<std::optional<smoke::ListenerWithProperties::ResultEnum>*>(handle);
}

uint32_t
library_smoke_ListenerWithProperties_ResultEnum_get_value_nullable(FfiOpaqueHandle handle)
{
    return gluecodium::ffi::Conversion<smoke::ListenerWithProperties::ResultEnum>::toFfi(
        **reinterpret_cast<std::optional<smoke::ListenerWithProperties::ResultEnum>*>(handle)
    );
}

FfiOpaqueHandle
library_smoke_ListenerWithProperties_get_type_id(FfiOpaqueHandle handle) {
    const auto& type_id = ::gluecodium::get_type_repository().get_id(reinterpret_cast<std::shared_ptr<smoke::ListenerWithProperties>*>(handle)->get());
    return reinterpret_cast<FfiOpaqueHandle>(new (std::nothrow) std::string(type_id));
}

#ifdef __cplusplus
}
#endif
