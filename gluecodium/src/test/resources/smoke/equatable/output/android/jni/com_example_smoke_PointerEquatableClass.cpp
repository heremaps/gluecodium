/*
 *
 */
#include "com_example_smoke_PointerEquatableClass.h"
#include "com_example_smoke_PointerEquatableClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
#include "JniWrapperCache.h"
extern "C" {
JNIEXPORT void JNICALL
Java_com_example_smoke_PointerEquatableClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}
jboolean
Java_com_example_smoke_PointerEquatableClass_equals(JNIEnv* _jenv, jobject _jinstance, jobject jrhs)
{
    if (_jinstance == nullptr || jrhs == nullptr) {
        return _jinstance == jrhs;
    }
    auto jclass = ::gluecodium::jni::get_object_class(_jenv, _jinstance);
    if (!_jenv->IsInstanceOf(jrhs, jclass.get())) {
        return false;
    }
    auto lhs = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableClass>*> (
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
Java_com_example_smoke_PointerEquatableClass_hashCode(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::PointerEquatableClass>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    return ::gluecodium::hash<std::shared_ptr<::smoke::PointerEquatableClass> >()(*pInstanceSharedPointer);
}
}
