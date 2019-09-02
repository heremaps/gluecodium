/*
 *

 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jobject JNICALL
Java_com_example_smoke_barInterface_BarMethod(JNIEnv* _jenv, jobject _jinstance, jstring jBarParameter);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_barInterface_make(JNIEnv* _jenv, jobject _jinstance, jstring jmakeParameter);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_barInterface_GET_1BAR_1PROPERTY(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_barInterface_SET_1BAR_1PROPERTY(JNIEnv* _jenv, jobject _jinstance, jlong jvalue);
#ifdef __cplusplus
}
#endif
