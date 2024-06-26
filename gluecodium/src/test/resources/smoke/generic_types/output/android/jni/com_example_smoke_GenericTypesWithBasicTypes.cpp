/*

 *
 */

#include "com_example_smoke_GenericTypesWithBasicTypes.h"
#include "com_example_smoke_GenericTypesWithBasicTypes__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< int32_t > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::vector< int32_t >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_list(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_map< int32_t, bool > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::unordered_map< int32_t, bool >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_map(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithSet(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_set< int32_t > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::std::unordered_set< int32_t >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_set(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithListTypeAlias(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::smoke::GenericTypesWithBasicTypes::BasicList input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::smoke::GenericTypesWithBasicTypes::BasicList>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_list_type_alias(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithMapTypeAlias(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::smoke::GenericTypesWithBasicTypes::BasicMap input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::smoke::GenericTypesWithBasicTypes::BasicMap>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_map_type_alias(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_methodWithSetTypeAlias(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::smoke::GenericTypesWithBasicTypes::BasicSet input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            ::gluecodium::jni::TypeId<::smoke::GenericTypesWithBasicTypes::BasicSet>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->method_with_set_type_alias(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}


jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_getListProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_list_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_GenericTypesWithBasicTypes_setListProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::vector< float > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::vector< float >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_list_property(value);

}



jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_getMapProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_map_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_GenericTypesWithBasicTypes_setMapProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::unordered_map< float, double > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::unordered_map< float, double >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_map_property(value);

}



jobject
Java_com_example_smoke_GenericTypesWithBasicTypes_getSetProperty(JNIEnv* _jenv, jobject _jinstance)

{



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    auto _result = (*pInstanceSharedPointer)->get_set_property();

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



void
Java_com_example_smoke_GenericTypesWithBasicTypes_setSetProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)

{



    ::std::unordered_set< float > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            ::gluecodium::jni::TypeId<::std::unordered_set< float >>{});



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));




    (*pInstanceSharedPointer)->set_set_property(value);

}




JNIEXPORT void JNICALL
Java_com_example_smoke_GenericTypesWithBasicTypes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithBasicTypes>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
