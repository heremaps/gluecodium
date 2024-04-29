/*

 *
 */

#include "com_example_smoke_Nullable.h"
#include "com_example_smoke_Nullable_SomeEnum__Conversion.h"
#include "com_example_smoke_Nullable_SomeStruct__Conversion.h"
#include "com_example_smoke_Nullable__Conversion.h"
#include "com_example_smoke_SomeInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jstring
Java_com_example_smoke_Nullable_methodWithString(JNIEnv* _jenv, jobject _jinstance, jstring jinput)

{



    std::optional< ::std::string > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::std::string >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_string(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithBoolean(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< bool > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< bool >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_boolean(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithDouble(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< double > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< double >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_double(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithInt(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< int64_t > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< int64_t >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_int(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithSomeStruct(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::smoke::Nullable::SomeStruct > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::smoke::Nullable::SomeStruct >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_some_struct(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithSomeEnum(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::smoke::Nullable::SomeEnum > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::smoke::Nullable::SomeEnum >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_some_enum(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithSomeArray(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::smoke::Nullable::SomeArray > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::smoke::Nullable::SomeArray >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_some_array(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithInlineArray(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::std::vector< ::std::string > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::std::vector< ::std::string > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_inline_array(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithSomeMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    std::optional< ::smoke::Nullable::SomeMap > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (std::optional< ::smoke::Nullable::SomeMap >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_some_map(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_Nullable_methodWithInstance(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::shared_ptr< ::smoke::SomeInterface > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::shared_ptr< ::smoke::SomeInterface >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_instance(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jstring
Java_com_example_smoke_Nullable_getStringProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_string_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setStringProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue)

{



    std::optional< ::std::string > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::std::string >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_string_property(value);

}



jobject
Java_com_example_smoke_Nullable_isBoolProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->is_bool_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setBoolProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< bool > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< bool >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_bool_property(value);

}



jobject
Java_com_example_smoke_Nullable_getDoubleProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_double_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setDoubleProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< double > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< double >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_double_property(value);

}



jobject
Java_com_example_smoke_Nullable_getIntProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_int_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setIntProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< int64_t > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< int64_t >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_int_property(value);

}



jobject
Java_com_example_smoke_Nullable_getStructProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_struct_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setStructProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< ::smoke::Nullable::SomeStruct > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::smoke::Nullable::SomeStruct >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_struct_property(value);

}



jobject
Java_com_example_smoke_Nullable_getEnumProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_enum_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setEnumProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< ::smoke::Nullable::SomeEnum > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::smoke::Nullable::SomeEnum >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_enum_property(value);

}



jobject
Java_com_example_smoke_Nullable_getArrayProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_array_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setArrayProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< ::smoke::Nullable::SomeArray > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::smoke::Nullable::SomeArray >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_array_property(value);

}



jobject
Java_com_example_smoke_Nullable_getInlineArrayProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_inline_array_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setInlineArrayProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< ::std::vector< ::std::string > > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::std::vector< ::std::string > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_inline_array_property(value);

}



jobject
Java_com_example_smoke_Nullable_getMapProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_map_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setMapProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    std::optional< ::smoke::Nullable::SomeMap > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (std::optional< ::smoke::Nullable::SomeMap >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_map_property(value);

}



jobject
Java_com_example_smoke_Nullable_getInstanceProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->get_instance_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_Nullable_setInstanceProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::shared_ptr< ::smoke::SomeInterface > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::shared_ptr< ::smoke::SomeInterface >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    (*pInstanceSharedPointer)->set_instance_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_Nullable_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::Nullable>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
