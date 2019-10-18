/*
 *
 */
#include "com_example_smoke_OuterClass_InnerClass.h"
#include "com_example_smoke_OuterClass_InnerClass__Conversion.h"
#include "ArrayConversionUtils.h"
#include "JniClassCache.h"
#include "JniReference.h"
extern "C" {
jstring
Java_com_example_smoke_OuterClass_00024InnerClass_foo(JNIEnv* _jenv, jobject _jinstance, jstring jinput)
{
    ::std::string input = ::gluecodium::jni::convert_from_jni(_jenv,
            ::gluecodium::jni::make_non_releasing_ref(jinput),
            (::std::string*)nullptr);
    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*> (
        ::gluecodium::jni::get_field_value(
            _jenv,
            ::gluecodium::jni::make_non_releasing_ref(_jinstance),
            "nativeHandle",
            (int64_t*)nullptr));
    auto result = (*pInstanceSharedPointer)->foo(input);
    return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
}
JNIEXPORT void JNICALL
Java_com_example_smoke_OuterClass_00024InnerClass_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)
{
    delete reinterpret_cast<std::shared_ptr<::smoke::OuterClass::InnerClass>*> (_jpointerRef);
}
}
