/*

 *
 */

#include "com_example_smoke_SimpleInterfaceImpl.h"
#include "com_example_smoke_SimpleInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_SimpleInterfaceImpl_getStringValue(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_string_value();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_SimpleInterfaceImpl_useSimpleInterface(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::shared_ptr< ::smoke::SimpleInterface > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::SimpleInterface >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->use_simple_interface(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_SimpleInterfaceImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::SimpleInterface>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
