/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jboolean JNICALL
Java_com_example_smoke_SkipFunctions_notInSwift(JNIEnv* _jenv, jobject _jinstance, jboolean jinput);
JNIEXPORT jfloat JNICALL
Java_com_example_smoke_SkipFunctions_notInDart(JNIEnv* _jenv, jobject _jinstance, jfloat jinput);
#ifdef __cplusplus
}
#endif
