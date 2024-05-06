/*

 *
 */

#include "com_example_smoke_OuterInterface_InnerClass.h"
#include "com_example_smoke_OuterInterface_InnerClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_OuterInterface_00024InnerClass_foo(JNIEnv* _jenv, jobject _jinstance, jstring jinput)

{



    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::string>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::OuterInterface::InnerClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->foo(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_OuterInterface_00024InnerClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::OuterInterface::InnerClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
