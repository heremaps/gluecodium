/*
 *
 */
#include "com_example_smoke_PointerEquatableInterface.h"
#include "com_example_smoke_PointerEquatableInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
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
    auto jclass = ::gluecodium::jni::get_object_class(_jenv, _jinstance);
    if (!_jenv->IsInstanceOf(jrhs, jclass.get())) {
        return false;
    }
    auto lhs = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto rhs = reinterpret_cast<std::shared_ptr<void>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(jrhs),
            "nativeHandle",
            (int64_t*)nullptr));
    return *lhs == *rhs;
}
jint
Java_com_example_smoke_PointerEquatableInterface_hashCode(JNIEnv* _jenv, jobject _jinstance){
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    return ::gluecodium::hash<std::shared_ptr<::smoke::PointerEquatableInterface> >()(*pInstanceSharedPointer);
}
}
