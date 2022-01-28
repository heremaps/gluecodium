/*
 *
 */
#include "com_example_smoke_NoCacheClass.h"
#include "com_example_smoke_NoCacheClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jlong
Java_com_example_smoke_NoCacheClass_make(JNIEnv* _jenv, jobject _jinstance)
{
    auto _result = ::smoke::NoCacheClass::make();
    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::smoke::NoCacheClass >(_result);
    if (nSharedPtr == nullptr)
    {
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "java/lang/OutOfMemoryError");
        _jenv->ThrowNew(exceptionClass.get(), "Cannot allocate native memory.");
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}
void
Java_com_example_smoke_NoCacheClass_foo(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::NoCacheClass>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->foo();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_NoCacheClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::NoCacheClass>*>(_jpointerRef);
    delete p_nobj;
}
}
