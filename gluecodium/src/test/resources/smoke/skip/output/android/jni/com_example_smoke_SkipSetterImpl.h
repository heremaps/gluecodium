/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jstring JNICALL
Java_com_example_smoke_SkipSetterImpl_getFoo(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
