/*

 *
 */

#include "com_example_smoke_Properties.h"
#include "com_example_smoke_PropertiesInterface__Conversion.h"
#include "com_example_smoke_Properties_ExampleStruct__Conversion.h"
#include "com_example_smoke_Properties_InternalErrorCode__Conversion.h"
#include "com_example_smoke_Properties__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {


jlong
Java_com_example_smoke_Properties_getBuiltInTypeProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_built_in_type_property();

    return _result;
}



void
Java_com_example_smoke_Properties_setBuiltInTypeProperty(JNIEnv* _jenv, jobject _jinstance, jlong jvalue)

{



    uint32_t value = jvalue;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_built_in_type_property(value);

}



jfloat
Java_com_example_smoke_Properties_getReadonlyProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_readonly_property();

    return _result;
}



jobject
Java_com_example_smoke_Properties_getStructProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_struct_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setStructProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::smoke::Properties::ExampleStruct value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::smoke::Properties::ExampleStruct>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_struct_property(value);

}



jobject
Java_com_example_smoke_Properties_getArrayProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_array_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setArrayProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::vector< ::std::string > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::vector< ::std::string >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_array_property(value);

}



jobject
Java_com_example_smoke_Properties_getComplexTypeProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_complex_type_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setComplexTypeProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::smoke::Properties::InternalErrorCode value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::smoke::Properties::InternalErrorCode>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_complex_type_property(value);

}



jbyteArray
Java_com_example_smoke_Properties_getByteBufferProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_byte_buffer_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setByteBufferProperty(JNIEnv* _jenv, jobject _jinstance, jbyteArray jvalue)

{



    ::std::shared_ptr< ::std::vector< uint8_t > > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::std::vector< uint8_t > >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_byte_buffer_property(value);

}



jobject
Java_com_example_smoke_Properties_getInstanceProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_instance_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setInstanceProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::shared_ptr< ::smoke::PropertiesInterface > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::shared_ptr< ::smoke::PropertiesInterface >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_instance_property(value);

}



jboolean
Java_com_example_smoke_Properties_isBooleanProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->is_boolean_property();

    return _result;
}



void
Java_com_example_smoke_Properties_setBooleanProperty(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)

{



    bool value = jvalue;



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Properties>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_boolean_property(value);

}



jstring
Java_com_example_smoke_Properties_getStaticProperty(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::Properties::get_static_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Properties_setStaticProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)

{



    ::std::string value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::string>{});





    ::smoke::Properties::set_static_property(value);

}



jobject
Java_com_example_smoke_Properties_getStaticReadonlyProperty(JNIEnv* _jenv, jobject _jinstance)

{





    auto _result = ::smoke::Properties::get_static_readonly_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}




JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Properties>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
