#pragma once
#include <jni.h>
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_ExternalClass.h"
#include "com_example_smoke_ExternalInterfaceImpl.h"
#include "com_example_smoke_SimpleClass.h"
#include "com_example_smoke_SimpleInterfaceImpl.h"
#include "com_example_smoke_forward_Class1.h"
#include "com_example_smoke_forward_Class2.h"
#include "com_example_smoke_forward_UseForwardImpl.h"
#include "foo/Bar.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
#include "smoke/forward/Class1.h"
#include "smoke/forward/Class2.h"
#include "smoke/forward/UseForward.h"
#include <memory>
#include <new>
#include "JniReference.h"
#include "ProxyConversion.h"
namespace genium
{
namespace jni
{
JniReference<jclass>& get_cached_native_base_class();
template < typename T >
::std::shared_ptr< T >
convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, ::std::shared_ptr< T >* dummy)
{
    ::std::shared_ptr< T > _nresult{};
    auto& nativeBaseClass = get_cached_native_base_class();
    if (_env->IsInstanceOf(_jobj.get(), nativeBaseClass.get()))
    {
        if (_jobj != nullptr)
        {
            auto long_ptr = get_field_value(
                _env,
                _jobj,
                "nativeHandle",
                (int64_t*)nullptr);
            _nresult = *reinterpret_cast<::std::shared_ptr< T >*>(long_ptr);
        }
    }
    else
    {
        createCppProxy<>( _env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::fire::Baz> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::ExternalInterface> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleClass> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::SimpleInterface> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::Class1> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::Class2> & _ninput);
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::smoke::forward::UseForward> & _ninput);
}
}
