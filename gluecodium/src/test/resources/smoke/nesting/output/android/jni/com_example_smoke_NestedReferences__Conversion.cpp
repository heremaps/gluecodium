/*
 *
 */
#include "com_example_smoke_NestedReferences__Conversion.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniClassCache.h"
#include <new>
namespace gluecodium
{
namespace jni
{
REGISTER_JNI_CLASS_CACHE("com/example/smoke/NestedReferences", com_example_smoke_NestedReferences, ::smoke::NestedReferences)
std::shared_ptr<::smoke::NestedReferences> convert_from_jni(JNIEnv* _env, const JniReference<jobject>& _jobj, std::shared_ptr<::smoke::NestedReferences>*)
{
    std::shared_ptr<::smoke::NestedReferences> _nresult{};
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
            _nresult = *reinterpret_cast<std::shared_ptr<::smoke::NestedReferences>*>(long_ptr);
        }
    }
    else
    {
        createCppProxy(_env, _jobj, _nresult);
    }
    return _nresult;
}
JniReference<jobject>
convert_to_jni(JNIEnv* _jenv, const std::shared_ptr<::smoke::NestedReferences>& _ninput)
{
    if ( !_ninput )
    {
        return {};
    }
    auto jResult = ::gluecodium::jni::CppProxyBase::getJavaObject( _ninput.get( ) );
    if ( jResult )
    {
        return jResult;
    }
    auto &javaClass = CachedJavaClass<::smoke::NestedReferences>::java_class;
    auto pInstanceSharedPointer = new (::std::nothrow) std::shared_ptr<::smoke::NestedReferences>(_ninput);
    if ( pInstanceSharedPointer == nullptr )
    {
        auto exceptionClass = find_class(_jenv, "java/lang/OutOfMemoryError" );
        _jenv->ThrowNew( exceptionClass.get(), "Cannot allocate native memory." );
    }
    jResult = ::gluecodium::jni::create_instance_object(
        _jenv, javaClass, reinterpret_cast<jlong>( pInstanceSharedPointer ) );
    return jResult;
}
}
}