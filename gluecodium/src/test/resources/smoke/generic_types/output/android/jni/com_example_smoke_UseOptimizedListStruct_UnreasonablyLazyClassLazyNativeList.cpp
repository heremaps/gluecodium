/*
 *
 */
#include "com_example_smoke_UnreasonablyLazyClass__Conversion.h"
#include "com_example_smoke_UseOptimizedListStruct_UnreasonablyLazyClassLazyNativeList.h"
#include "JniReference.h"
#include <memory>
#include <vector>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef) {
    delete reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>(_jpointerRef);
}
JNIEXPORT jint JNICALL
Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_getSize(JNIEnv* _jenv, jobject _jinstance) {
    auto handle = ::gluecodium::jni::get_field_value(
        _jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        "nativeHandle",
        (int64_t*)nullptr
    );
    auto& vector = *reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>(handle);
    return vector->size();
}
JNIEXPORT jobject JNICALL
Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_get(JNIEnv* _jenv, jobject _jinstance, jint index) {
    auto handle = ::gluecodium::jni::get_field_value(
        _jenv,
        ::gluecodium::jni::make_non_releasing_ref(_jinstance),
        "nativeHandle",
        (int64_t*)nullptr
    );
    auto& vector = *reinterpret_cast<std::shared_ptr<::std::vector< ::std::shared_ptr< ::smoke::UnreasonablyLazyClass > >>*>(handle);
    if (index < 0 || index >= vector->size()) {
        auto exceptionClass = ::gluecodium::jni::find_class(_jenv, "java/lang/IndexOutOfBoundsException");
        _jenv->ThrowNew(exceptionClass.get(), "List index out of bounds.");
        return {};
    } else {
        auto& result = vector->operator[](index);
        return ::gluecodium::jni::convert_to_jni(_jenv, result).release();
    }
}
#ifdef __cplusplus
}
#endif
