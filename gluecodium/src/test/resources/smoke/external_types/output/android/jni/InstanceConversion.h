/*
 *
 */
#pragma once
#include <jni.h>
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_FooClass.h"
#include "foo/Bar.h"
#include <memory>
#include <new>
#include "JniReference.h"
#include "gluecodium/Optional.h"
#include "ProxyConversion.h"
#include <functional>
namespace gluecodium
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
JniReference<jobject> convert_to_jni(JNIEnv* _jenv, const ::std::shared_ptr<::foo::BarClass> & _ninput);
template<class R, class... Args>
optional<::std::function<R(Args...)>>
convert_from_jni(JNIEnv* _jenv, const JniReference<jobject>& _jinput, optional<::std::function<R(Args...)>>*)
{
    return _jinput
        ? convert_from_jni(_jenv, _jinput, (::std::function<R(Args...)>*)nullptr)
        : optional<::std::function<R(Args...)>>{};
}
template<class R, class... Args>
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const optional<::std::function<R(Args...)>> _ninput)
{
    return _ninput ? convert_to_jni(_jenv, *_ninput) : JniReference<jobject>{};
}
}
}
