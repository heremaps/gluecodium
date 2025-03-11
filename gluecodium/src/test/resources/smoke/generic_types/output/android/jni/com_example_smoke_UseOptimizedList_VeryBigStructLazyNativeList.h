/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_disposeNativeHandle(JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef);
JNIEXPORT jint JNICALL Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_obtainSize(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL Java_com_example_smoke_UseOptimizedList_00024VeryBigStructLazyNativeList_get(JNIEnv* _jenv, jobject _jinstance, jint index);

#ifdef __cplusplus
}
#endif
