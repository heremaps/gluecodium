/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jobject JNICALL
Java_com_example_smoke_JavaExternalCtor_make(JNIEnv* _jenv, jobject _jinstance, jstring jfield);



#ifdef __cplusplus
}
#endif
