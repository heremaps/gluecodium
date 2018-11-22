#pragma once
#include <jni.h>
#include <memory>
#include <new>
#include "smoke/SimpleInstantiable.h"
#include "com_example_smoke_SimpleInstantiable.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "smoke/NestedInstantiable.h"
#include "com_example_smoke_NestedInstantiable.h"
#include "smoke/InstanceWithStruct.h"
#include "com_example_smoke_InstanceWithStruct.h"
#include "ProxyConversion.h"
namespace genium {
namespace jni {
template < typename T >
::std::shared_ptr< T >
convert_from_jni( JNIEnv* _env, jobject _jobj, ::std::shared_ptr< T >* dummy ) {
    ::std::shared_ptr< T > _nresult{};
    jclass nativeBaseClass = _env->FindClass("com/example/NativeBase");
    if (_env->IsInstanceOf(_jobj, nativeBaseClass)) {
        if (_jobj != nullptr) {
            auto long_ptr = genium::jni::get_long_field(_env, _env->GetObjectClass(_jobj), _jobj, "nativeHandle");
            _nresult = *reinterpret_cast<::std::shared_ptr< T >*> (long_ptr);
        }
    } else {
        ::createCppProxy<>( _env, _jobj, _nresult);
    }
    _env->DeleteLocalRef( nativeBaseClass );
    return _nresult;
}
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInstantiable> & _ninput);
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::NestedInstantiable> & _ninput);
jobject convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::InstanceWithStruct> & _ninput);
}
}
