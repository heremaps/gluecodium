/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jstring JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_regularFunction(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_staticFunction(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_getRegularProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_setRegularProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_getStaticProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_InterfaceWithStaticImpl_setStaticProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue);
#ifdef __cplusplus
}
#endif
