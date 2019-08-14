/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "namerules/NameRules.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_namerules_NAME_RULES_DROID.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
jlong
Java_com_example_namerules_NAME_1RULES_1DROID_create(JNIEnv* _jenv, jobject _jinstance)
{
    auto result = ::namerules::NameRules::create();
    auto nSharedPtr = new (::std::nothrow) ::std::shared_ptr< ::namerules::NameRules >(result);
    if (nSharedPtr == nullptr)
    {
        auto exceptionClass = ::jni::find_class(_jenv, "java/lang/OutOfMemoryError");
        _jenv->ThrowNew(exceptionClass.get(), "Cannot allocate native memory.");
        return 0;
    }
    return reinterpret_cast<jlong>(nSharedPtr);
}
jdouble
Java_com_example_namerules_NAME_1RULES_1DROID_some_1method(JNIEnv* _jenv, jobject _jinstance, jobject jsome_argument)
{
    ::namerules::NameRules::ExampleStruct some_argument = ::jni::convert_from_jni(_jenv,
            ::jni::make_non_releasing_ref(jsome_argument),
            (::namerules::NameRules::ExampleStruct*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto nativeCallResult = (*pInstanceSharedPointer)->someMethod(some_argument);
    auto errorCode = nativeCallResult.error();
    if (!nativeCallResult.has_value())
    {
        auto nEnumValue = static_cast<::namerules::NameRules::ExampleError>(errorCode.value());
        auto jEnumValue = ::jni::convert_to_jni(_jenv, nEnumValue);
        auto exceptionClass = ::jni::find_class(_jenv, "com/example/namerules/NAME_RULES_DROID$example_error_x");
        auto theConstructor = _jenv->GetMethodID(exceptionClass.get(), "<init>", "(Lcom/example/namerules/NAME_RULES_DROID$EXAMPLE_ERROR_DROID;)V");
        auto exception = ::jni::new_object(_jenv, exceptionClass, theConstructor, jEnumValue);
        _jenv->Throw(static_cast<jthrowable>(exception.release()));
        return nativeCallResult.unsafe_value();
    }
    auto result = nativeCallResult.unsafe_value();
    return result;
}
jlong
Java_com_example_namerules_NAME_1RULES_1DROID_loadIntProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->retrieve_int_property();
    return result;
}
void
Java_com_example_namerules_NAME_1RULES_1DROID_STORE_1INT_1PROPERTY(JNIEnv* _jenv, jobject _jinstance, jlong jvalue)
{
    uint32_t value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->STORE_INT_PROPERTY_NOW(value);
}
jboolean
Java_com_example_namerules_NAME_1RULES_1DROID_loadBooleanProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->really_boolean_property();
    return result;
}
void
Java_com_example_namerules_NAME_1RULES_1DROID_STORE_1BOOLEAN_1PROPERTY(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue)
{
    bool value = jvalue;
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->STORE_BOOLEAN_PROPERTY_NOW(value);
}
jobject
Java_com_example_namerules_NAME_1RULES_1DROID_loadStructProperty(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->retrieve_struct_property();
    return ::jni::convert_to_jni(_jenv, result).release();
}
void
Java_com_example_namerules_NAME_1RULES_1DROID_STORE_1STRUCT_1PROPERTY(JNIEnv* _jenv, jobject _jinstance, jobject jvalue)
{
    ::namerules::NameRules::ExampleStruct value = ::jni::convert_from_jni(_jenv,
            ::jni::make_non_releasing_ref(jvalue),
            (::namerules::NameRules::ExampleStruct*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (
        ::jni::get_field_value(
            _jenv,
            ::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->STORE_STRUCT_PROPERTY_NOW(value);
}
JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1DROID_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::namerules::NameRules>*> (_jpointerRef);
}
}
