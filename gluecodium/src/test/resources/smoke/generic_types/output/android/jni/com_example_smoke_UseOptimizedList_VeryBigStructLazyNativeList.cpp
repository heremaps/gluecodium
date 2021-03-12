/*
 *
 */
#include "com_example_smoke_UseOptimizedList_VeryBigStructLazyNativeList.h"
#include "com_example_smoke_VeryBigStruct__Conversion.h"
#include "JniReference.h"
#include <memory>
#include <vector>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef) {
    delete reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>*>(_jpointerRef);
}
JNIEXPORT jint JNICALL
Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_getSize(JNIEnv* _jenv, jobject _jinstance) {
    auto handle = ::gluecodium::jni::get_field_value(
        _jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        "nativeHandle",
        (int64_t*)nullptr
    );
    auto& vector = *reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>*>(handle);
    return vector->size();
}
JNIEXPORT jobject JNICALL
Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_get(JNIEnv* _jenv, jobject _jinstance, jint index) {
    auto handle = ::gluecodium::jni::get_field_value(
        _jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        "nativeHandle",
        (int64_t*)nullptr
    );
    auto& vector = *reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::VeryBigStruct > >>*>(handle);
    if (index < 0 || index >= vector->size()) {
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "java/lang/IndexOutOfBoundsException");
        _jenv->ThrowNew(exceptionClass.get(), "List index out of bounds.");
        return {};
    } else {
        auto& result = *vector->operator[](index);
        return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
    }
}
#ifdef __cplusplus
}
#endif
