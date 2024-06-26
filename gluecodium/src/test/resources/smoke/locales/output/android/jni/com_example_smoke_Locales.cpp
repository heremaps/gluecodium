/*

 *
 */

#include "com_example_smoke_Locales.h"
#include "com_example_smoke_Locales__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_Locales_localeMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::gluecodium::Locale input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::gluecodium::Locale>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Locales>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->locale_method(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_Locales_getLocaleProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Locales>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_locale_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Locales_setLocaleProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::gluecodium::Locale value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::gluecodium::Locale>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Locales>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_locale_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_Locales_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Locales>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
