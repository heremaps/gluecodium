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
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Thermometer_throwingMake(JNIEnv* _jenv, jobject _jinstance, jint jid, jobject jobservers);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Thermometer_nothrowMake(JNIEnv* _jenv, jobject _jinstance, jstring jlabel, jobject jniceObservers);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Thermometer_anotherThrowingMake(JNIEnv* _jenv, jobject _jinstance, jboolean jdummy, jobject jobservers);
JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_notifyObservers(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer, jobject jsomeObservers);
JNIEXPORT void JNICALL
Java_com_example_smoke_Thermometer_throwingNotifyObservers(JNIEnv* _jenv, jobject _jinstance, jobject jthermometer, jobject jsomeObservers);
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
