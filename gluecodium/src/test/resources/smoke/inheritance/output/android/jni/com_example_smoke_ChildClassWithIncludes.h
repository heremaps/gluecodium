/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jobject JNICALL
Java_com_example_smoke_ChildClassWithIncludes_rootMethod(JNIEnv* _jenv, jobject _jinstance, jobject jinput1, jobject jinput2);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_ChildClassWithIncludes_getRootProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassWithIncludes_setRootProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
#ifdef __cplusplus
}
#endif
