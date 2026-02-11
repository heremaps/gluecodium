/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif


JNIEXPORT jobject JNICALL
Java_com_example_smoke_CachedProperties_getCachedProperty_1private(JNIEnv* _jenv, jobject _jinstance);


JNIEXPORT jobject JNICALL
Java_com_example_smoke_CachedProperties_getInternalCachedProperty_1private(JNIEnv* _jenv, jobject _jinstance);


JNIEXPORT jbyteArray JNICALL
Java_com_example_smoke_CachedProperties_getStaticCachedProperty_1private(JNIEnv* _jenv, jobject _jinstance);


JNIEXPORT jbyteArray JNICALL
Java_com_example_smoke_CachedProperties_getInternalStaticCachedProperty_1private(JNIEnv* _jenv, jobject _jinstance);




#ifdef __cplusplus
}
#endif
