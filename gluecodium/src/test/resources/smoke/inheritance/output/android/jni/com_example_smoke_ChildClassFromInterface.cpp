/*
 *
 */
#include "com_example_smoke_ChildClassFromInterface.h"
#include "com_example_smoke_ChildClassFromInterface__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
void
Java_com_example_smoke_ChildClassFromInterface_childClassMethod(JNIEnv* _jenv, jobject _jinstance)
{
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    (*pInstanceSharedPointer)->child_class_method();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterface_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::ChildClassFromInterface>*> (_jpointerRef);
}
}
