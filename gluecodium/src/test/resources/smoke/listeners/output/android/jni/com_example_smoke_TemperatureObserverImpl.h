/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL
Java_com_example_smoke_TemperatureObserverImpl_onTemperatureUpdate(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer);



#ifdef __cplusplus
}
#endif
