/*
 *

 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jobject JNICALL
Java_com_example_smoke_UseFreeTypes_doStuff(JNIEnv* _jenv, jobject _jinstance, jobject jpoint, jobject jmode);
#ifdef __cplusplus
}
#endif
