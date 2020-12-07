/*
 *
 */
#include "com_example_smoke_Point__Conversion.h"
#include "com_example_smoke_TypeDefs.h"
#include "com_example_smoke_TypeDefs_TestStruct__Conversion.h"
#include "com_example_smoke_TypeDefs__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
jdouble
Java_com_example_smoke_TypeDefs_methodWithPrimitiveTypeDef(JNIEnv* _jenv, jobject _jinstance, jdouble jinput)
{
    double input = jinput;
    auto result = ::smoke::TypeDefs::method_with_primitive_type_def(input);
    return result;
}
jobject
Java_com_example_smoke_TypeDefs_methodWithComplexTypeDef(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::std::vector< ::smoke::TypeDefs::TestStruct > input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::vector< ::smoke::TypeDefs::TestStruct >*)nullptr);
    auto result = ::smoke::TypeDefs::method_with_complex_type_def(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jdouble
Java_com_example_smoke_TypeDefs_returnNestedIntTypeDef(JNIEnv* _jenv, jobject _jinstance, jdouble jinput)
{
    double input = jinput;
    auto result = ::smoke::TypeDefs::return_nested_int_type_def(input);
    return result;
}
jobject
Java_com_example_smoke_TypeDefs_returnTestStructTypeDef(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::TypeDefs::TestStruct input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::smoke::TypeDefs::TestStruct*)nullptr);
    auto result = ::smoke::TypeDefs::return_test_struct_type_def(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_TypeDefs_returnNestedStructTypeDef(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::TypeDefs::TestStruct input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::smoke::TypeDefs::TestStruct*)nullptr);
    auto result = ::smoke::TypeDefs::return_nested_struct_type_def(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_TypeDefs_returnTypeDefPointFromTypeCollection(JNIEnv* _jenv, jobject _jinstance, jobject jinput)
{
    ::smoke::Point input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::smoke::Point*)nullptr);
    auto result = ::smoke::TypeDefs::return_type_def_point_from_type_collection(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
jobject
Java_com_example_smoke_TypeDefs_getPrimitiveTypeProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::TypeDefs>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->get_primitive_type_property();
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_smoke_TypeDefs_setPrimitiveTypeProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef > value = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jvalue),
            (::std::vector< ::smoke::TypeDefs::PrimitiveTypeDef >*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::TypeDefs>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->set_primitive_type_property(value);
}
JNIEXPORT void JNICALL
Java_com_example_smoke_TypeDefs_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::TypeDefs>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
}
