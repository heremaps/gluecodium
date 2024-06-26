/*

 *
 */

#include "com_example_smoke_Lambdas_ConfounderImpl.h"
#include "com_example_smoke_Lambdas_Confounder__Conversion.h"
#include "com_example_smoke_Lambdas_Producer__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_Lambdas_00024ConfounderImpl_confuse(JNIEnv* _jenv, jobject _jinstance, jstring jp0)

{



    ::std::string p0 = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jp0),
            ::gluecodium::jni::TypeId<::std::string>{});



    auto pInstanceSharedPointer = reinterpret_cast<::smoke::Lambdas::Confuser*>(

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));



    auto _result = (*pInstanceSharedPointer)(p0);

    return ::gluecodium::jni::com_example_smoke_Lambdas_00024Producer_convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_Lambdas_00024ConfounderImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<::smoke::Lambdas::Confuser*>(_jpointerRef);
}

}
