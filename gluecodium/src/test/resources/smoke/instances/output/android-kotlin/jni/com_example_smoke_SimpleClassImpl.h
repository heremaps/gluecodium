/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jstring JNICALL
Java_com_example_smoke_SimpleClassImpl_getStringValue(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_SimpleClassImpl_useSimpleClass(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_SimpleClassImpl_defaultTitle(JNIEnv* _jenv, jobject _jinstance);

JNIEXPORT jstring JNICALL
Java_com_example_smoke_SimpleClassImpl_getTitle(JNIEnv* _jenv, jobject _jinstance);




#ifdef __cplusplus
}
#endif
