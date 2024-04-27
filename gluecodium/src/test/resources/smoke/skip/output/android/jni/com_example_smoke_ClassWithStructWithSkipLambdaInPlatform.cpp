/*

 *
 */

#include "com_example_smoke_ClassWithStructWithSkipLambdaInPlatform.h"
#include "com_example_smoke_ClassWithStructWithSkipLambdaInPlatform__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {



JNIEXPORT void JNICALL
Java_com_example_smoke_ClassWithStructWithSkipLambdaInPlatform_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::ClassWithStructWithSkipLambdaInPlatform>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
