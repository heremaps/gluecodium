/*
 *
 */
#include "com_example_smoke_GenericTypesWithGenericTypes.h"
#include "com_example_smoke_GenericTypesWithGenericTypes__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithListOfLists(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::std::vector< int32_t > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::std::vector< int32_t > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_list_of_lists(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithMapOfMaps(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::std::unordered_map< int32_t, bool > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_map_of_maps(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithSetOfSets(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_set< ::std::unordered_set< int32_t >, ::gluecodium::hash< ::std::unordered_set< int32_t > > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_set_of_sets(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithListAndMap(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::std::unordered_map< int32_t, bool > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::std::unordered_map< int32_t, bool > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_list_and_map(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithListAndSet(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::std::unordered_set< int32_t > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::std::unordered_set< int32_t > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_list_and_set(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithMapAndSet(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< int32_t, ::std::unordered_set< int32_t > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< int32_t, ::std::unordered_set< int32_t > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_map_and_set(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
jobject
Java_com_example_smoke_GenericTypesWithGenericTypes_methodWithMapGenericKeys(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::unordered_map< ::std::unordered_set< int32_t >, bool, ::gluecodium::hash< ::std::unordered_set< int32_t > > >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto _result = (*pInstanceSharedPointer)->method_with_map_generic_keys(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, _result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_GenericTypesWithGenericTypes_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::GenericTypesWithGenericTypes>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
