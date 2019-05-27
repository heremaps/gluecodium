/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/EquatableInterface.h"
#include "com_example_smoke_EquatableInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"
#include "EnumSetConversion.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "JniReference.h"
extern "C" {
JNIEXPORT void JNICALL
Java_com_example_smoke_EquatableInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*> (_jpointerRef);
}
jboolean
Java_com_example_smoke_EquatableInterface_equals(JNIEnv* _jenv, jobject _jinstance, jobject jrhs)
{
    if (_jinstance == nullptr || jrhs == nullptr) {
        return _jinstance == jrhs;
    }
    auto& jclass = ::genium::jni::get_cached_native_base_class();
    if (!_jenv->IsInstanceOf(jrhs, jclass.get())) {
        return false;
    }
    auto lhs = reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto rhs = reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(jrhs),
            "nativeHandle",
            (int64_t*)nullptr));
    return **lhs == **rhs;
}
jint
Java_com_example_smoke_EquatableInterface_hashCode(JNIEnv* _jenv, jobject _jinstance){
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::EquatableInterface>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    return std::hash<::smoke::EquatableInterface>()(**pInstanceSharedPointer);
}
}
