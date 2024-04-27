/*

 *
 */

#include "com_example_smoke_InterfaceWithStaticImpl.h"
#include "com_example_smoke_InterfaceWithStatic__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_InterfaceWithStaticImpl_regularFunction(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->regular_function();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jstring
Java_com_example_smoke_InterfaceWithStaticImpl_staticFunction(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::InterfaceWithStatic::static_function();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jstring
Java_com_example_smoke_InterfaceWithStaticImpl_getRegularProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_regular_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_InterfaceWithStaticImpl_setRegularProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)

{



    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_regular_property(value);

}



jstring
Java_com_example_smoke_InterfaceWithStaticImpl_getStaticProperty(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::InterfaceWithStatic::get_static_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_InterfaceWithStaticImpl_setStaticProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)

{



    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::string*)nullptr);





    ::smoke::InterfaceWithStatic::set_static_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::InterfaceWithStatic>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
