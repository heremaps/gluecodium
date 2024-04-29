/*

 *
 */

#include "com_example_smoke_SimpleClass.h"
#include "com_example_smoke_SimpleClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_SimpleClass_getStringValue(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_string_value();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_SimpleClass_useSimpleClass(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::shared_ptr< ::smoke::SimpleClass > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::shared_ptr< ::smoke::SimpleClass >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->use_simple_class(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_SimpleClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SimpleClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
