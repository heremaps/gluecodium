/*

 *
 */

#include "com_example_Foo.h"
#include "com_example_Foo__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_JavaExternalCtor_make(JNIEnv* _jenv, jobject _jinstance, jstring jfield)

{



    ::std::string field = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jfield),
            (::std::string*)nullptr);





    auto _result = ::smoke::JavaExternalCtor::make(field);

    return ::gluecodium::jni::convert_to_jni_internal(_jenv, _result).release();
}



}
