/*
 *

 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_Errors_methodWithErrors(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Errors_methodWithExternalErrors(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_Errors_methodWithErrorsAndReturnValue(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Errors_methodWithAliasedError(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
