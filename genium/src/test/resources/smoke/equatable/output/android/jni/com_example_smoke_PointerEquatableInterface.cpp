/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#include "smoke/PointerEquatableInterface.h"
#include "com_example_smoke_PointerEquatableInterface.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ProxyConversion.h"
#include "EnumConversion.h"
#include "ArrayConversionUtils.h"
#include "JniReference.h"
extern "C" {
JNIEXPORT void JNICALL
Java_com_example_smoke_PointerEquatableInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableInterface>*> (_jpointerRef);
}
jboolean
Java_com_example_smoke_PointerEquatableInterface_equals(JNIEnv* _jenv, jobject _jinstance, jobject jrhs)
{
    if (_jinstance == nullptr || jrhs == nullptr) {
        return _jinstance == jrhs;
    }
    auto jclass = ::genium::jni::get_object_class(_jenv, _jinstance);
    if (!_jenv->IsInstanceOf(jrhs, jclass.get())) {
        return false;
    }
    auto lhs = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableInterface>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto rhs = reinterpret_cast<std::shared_ptr<void>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(jrhs),
            "nativeHandle",
            (int64_t*)nullptr));
    return *lhs == *rhs;
}
jint
Java_com_example_smoke_PointerEquatableInterface_hashCode(JNIEnv* _jenv, jobject _jinstance){
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableInterface>*> (
        ::genium::jni::get_field_value(
            _jenv,
            ::genium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    return std::hash<std::shared_ptr<::smoke::PointerEquatableInterface> >()(*pInstanceSharedPointer);
}
}