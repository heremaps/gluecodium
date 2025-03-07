/*

 *
 */

#include "kotlin_Boolean__Nullable__.h"
#include "kotlin_Boolean__Nullable____Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_kotlinsmoke_VeryBoolean_make(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)

{



    bool value = jvalue;





    auto _result = ::kotlin_smoke::VeryBoolean::make(value);

    return ::gluecodium::jni::convert_to_jni_internal(_jenv, _result).release();
}



}
