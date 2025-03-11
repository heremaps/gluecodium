/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef);
JNIEXPORT jint JNICALL Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_obtainSize(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL Java_com_example_smoke_UseOptimizedListStruct_00024UnreasonablyLazyClassLazyNativeList_get(JNIEnv* _jenv, jobject _jinstance, jint index);

#ifdef __cplusplus
}
#endif
