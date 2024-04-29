/*

 *
 */

#include "com_example_smoke_DummyClass__Conversion.h"
#include "com_example_smoke_DummyInterface__Conversion.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes_BasicStruct__Conversion.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes_ExternalEnum__Conversion.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes_ExternalStruct__Conversion.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes_SomeEnum__Conversion.h"
#include "com_example_smoke_GenericTypesWithCompoundTypes__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithStructList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_struct_list(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithStructMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< ::std::string, ::smoke::GenericTypesWithCompoundTypes::BasicStruct >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_struct_map(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_enum_list(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapKey(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, bool, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_enum_map_key(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumMapValue(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::smoke::GenericTypesWithCompoundTypes::SomeEnum >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_enum_map_value(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithEnumSet(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_set< ::smoke::GenericTypesWithCompoundTypes::SomeEnum, ::gluecodium::hash< ::smoke::GenericTypesWithCompoundTypes::SomeEnum > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_enum_set(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithInstancesList(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::vector< ::std::shared_ptr< ::smoke::DummyClass > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::std::shared_ptr< ::smoke::DummyClass > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_instances_list(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}

jobject
Java_com_example_smoke_GenericTypesWithCompoundTypes_methodWithInstancesMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)

{



    ::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::std::shared_ptr< ::smoke::DummyClass > >*)nullptr);



    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*> (

        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));




    auto _result = (*pInstanceSharedPointer)->method_with_instances_map(input);

    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}



JNIEXPORT void JNICALL
Java_com_example_smoke_GenericTypesWithCompoundTypes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithCompoundTypes>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

}
