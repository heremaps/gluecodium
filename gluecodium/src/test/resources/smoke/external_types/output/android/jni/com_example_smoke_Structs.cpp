/*
 *
 */
#include "com_example_smoke_Structs.h"
#include "com_example_smoke_Structs_AnotherExternalStruct__Conversion.h"
#include "com_example_smoke_Structs_ExternalStruct__Conversion.h"
#include "com_example_smoke_Structs__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_Structs_getExternalStruct(JNIEnv* _jenv, jobject _jinstance)
{
    auto _result = ::smoke::Structs::get_external_struct();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_Structs_getAnotherExternalStruct(JNIEnv* _jenv, jobject _jinstance)
{
    auto _result = ::smoke::Structs::get_another_external_struct();
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_Structs_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Structs>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
