/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL
Java_com_example_smoke_ExternalInterfaceImpl_someMethod(JNIEnv* _jenv, jobject _jinstance, jbyte jsomeParameter);

JNIEXPORT jstring JNICALL
Java_com_example_smoke_ExternalInterfaceImpl_getSomeProperty(JNIEnv* _jenv, jobject _jinstance);




#ifdef __cplusplus
}
#endif
