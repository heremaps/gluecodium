/*

 *
 */

#include "com_example_smoke_KotlinMethodOverloads.h"
#include "com_example_smoke_KotlinMethodOverloads__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

void
Java_com_example_smoke_KotlinMethodOverloads_three__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput)

{



    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::string>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::KotlinMethodOverloads>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->one(input);

}

void
Java_com_example_smoke_KotlinMethodOverloads_three__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< ::std::string > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::vector< ::std::string >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::KotlinMethodOverloads>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->two(input);

}



JNIEXPORT void JNICALL
Java_com_example_smoke_KotlinMethodOverloads_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::KotlinMethodOverloads>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
