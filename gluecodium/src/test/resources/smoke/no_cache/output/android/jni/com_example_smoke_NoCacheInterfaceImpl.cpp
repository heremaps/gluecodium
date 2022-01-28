/*
 *
 */
#include "com_example_smoke_NoCacheInterfaceImpl.h"
#include "com_example_smoke_NoCacheInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
void
Java_com_example_smoke_NoCacheInterfaceImpl_foo(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::NoCacheInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->foo();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_NoCacheInterfaceImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::NoCacheInterface>*>(_jpointerRef);
    delete p_nobj;
}
}
