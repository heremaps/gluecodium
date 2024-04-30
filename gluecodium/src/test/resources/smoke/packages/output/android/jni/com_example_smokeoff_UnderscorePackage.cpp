/*

 *
 */

#include "com_example_smokeoff_UnderscorePackage.h"
#include "com_example_smokeoff_UnderscorePackage__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smokeoff_UnderscorePackage_basicMethod(JNIEnv* _jenv, jobject _jinstance, jstring jinputString)

{



    ::std::string inputString = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinputString),
            (::std::string*)nullptr);





    auto _result = ::smoke_off::UnderscorePackage::basic_method(inputString);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smokeoff_UnderscorePackage_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke_off::UnderscorePackage>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
