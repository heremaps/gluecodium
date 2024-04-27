/*

 *
 */

#include "com_example_smoke_ExternalInterfaceImpl.h"
#include "com_example_smoke_ExternalInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_ExternalInterfaceImpl_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)

{



    int8_t someParameter = jsomeParameter;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->some_Method(someParameter);

}


jstring
Java_com_example_smoke_ExternalInterfaceImpl_getSomeProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_Me();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}




JNIEXPORT void JNICALL
Java_com_example_smoke_ExternalInterfaceImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::ExternalInterface>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
