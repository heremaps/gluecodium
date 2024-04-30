/*

 *
 */

#include "com_example_smoke_Basic.h"
#include "com_example_smoke_Basic__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_Basic_basicMethod(JNIEnv* _jenv, jobject _jinstance, jstring jinputString)

{



    ::std::string inputString = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinputString),
            (::std::string*)nullptr);





    auto _result = ::root::space::smoke::Basic::basic_method(inputString);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_Basic_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::root::space::smoke::Basic>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
