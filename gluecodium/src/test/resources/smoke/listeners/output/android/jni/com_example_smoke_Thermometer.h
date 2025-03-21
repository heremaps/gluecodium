/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jlong JNICALL
Java_com_example_smoke_Thermometer_makeWithDuration(JNIEnv* _jenv, jobject _jinstance, jobject jinterval, jobject jobservers);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Thermometer_makeWithoutDuration(JNIEnv* _jenv, jobject _jinstance, jobject jobservers);
JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_notifyObservers(JNIEnv* _jenv, jobject _jinstance, jobject jself, jobject jobservers);
JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_forceUpdate(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jdouble JNICALL
Java_com_example_smoke_Thermometer_getCelsius(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jdouble JNICALL
Java_com_example_smoke_Thermometer_getKelvin(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jdouble JNICALL
Java_com_example_smoke_Thermometer_getFahrenheit(JNIEnv* _jenv, jobject _jinstance);



#ifdef __cplusplus
}
#endif
