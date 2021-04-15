/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfUnquoted(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfUnquotedList(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfQuoted(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfQuotedList(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfTagged(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfTaggedList(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_EnableIfEnabled_enableIfMixedList(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
