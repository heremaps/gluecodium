/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_create(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_release(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_createProxy(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_SpecialNames_Uppercase(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_SpecialNames_make(JNIEnv* _jenv, jobject _jinstance, jstring jresult);
#ifdef __cplusplus
}
#endif
