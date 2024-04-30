/*

 *
 */

#include "com_example_smoke_ExternalClass.h"
#include "com_example_smoke_ExternalClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_ExternalClass_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter)

{



    int8_t someParameter = jsomeParameter;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->some_Method(someParameter);

}


jstring
Java_com_example_smoke_ExternalClass_getSomeProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::fire::Baz>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_Me();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}




JNIEXPORT void JNICALL
Java_com_example_smoke_ExternalClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::fire::Baz>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
