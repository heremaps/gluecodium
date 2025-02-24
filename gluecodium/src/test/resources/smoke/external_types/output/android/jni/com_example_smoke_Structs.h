/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jobject JNICALL
Java_com_example_smoke_Structs_getExternalStruct(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Structs_getAnotherExternalStruct(JNIEnv* _jenv, jobject _jinstance);



#ifdef __cplusplus
}
#endif
