/*
 *
 */
#include "com_example_smoke_ChildClassFromClass.h"
#include "com_example_smoke_ChildClassFromClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
void
Java_com_example_smoke_ChildClassFromClass_childClassMethod(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromClass>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->child_class_method();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromClass>*> (_jpointerRef);
}
}
