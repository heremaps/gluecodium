/*
 *

 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jlong JNICALL
Java_com_example_package_Class_constructor(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL
Java_com_example_package_Class_fun(JNIEnv* _jenv, jobject _jinstance, jobject jdouble);
JNIEXPORT jobject JNICALL
Java_com_example_package_Class_getProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_package_Class_setProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
#ifdef __cplusplus
}
#endif
