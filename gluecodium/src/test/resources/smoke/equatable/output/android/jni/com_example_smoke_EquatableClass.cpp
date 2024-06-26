/*

 *
 */

#include "com_example_smoke_EquatableClass.h"
#include "com_example_smoke_EquatableClass__Conversion.h"
#include "com_example_smoke_PointerEquatableClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniNativeHandle.h"
#include "JniReference.h"
#include "JniThrowNewException.h"
#include "JniWrapperCache.h"

extern "C" {



JNIEXPORT void JNICALL
Java_com_example_smoke_EquatableClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    auto p_nobj = reinterpret_cast<std::shared_ptr<::smoke::EquatableClass>*>(_jpointerRef);
    ::gluecodium::jni::JniWrapperCache::remove_cached_wrapper(_jenv, *p_nobj);
    delete p_nobj;
}

jboolean
Java_com_example_smoke_EquatableClass_equals(JNIEnv* _jenv, jobject _jinstance, jobject jrhs)
{
    if (_jinstance == nullptr || jrhs == nullptr) {
        return _jinstance == jrhs;
    }
    auto& jclass = ::gluecodium::jni::get_cached_native_base_class();
    if (!_jenv->IsInstanceOf(jrhs, jclass.get())) {
        return false;
    }
    auto lhs = reinterpret_cast<std::shared_ptr<::smoke::EquatableClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));

    auto rhs = reinterpret_cast<std::shared_ptr<::smoke::EquatableClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,jrhs));

    return **lhs == **rhs;
}

jint
Java_com_example_smoke_EquatableClass_hashCode(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::EquatableClass>*> (

        ::gluecodium::jni::get_class_native_handle(_jenv,_jinstance));

    return ::gluecodium::hash<std::shared_ptr<::smoke::EquatableClass> >()(*pInstanceSharedPointer);
}
}
