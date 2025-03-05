/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_currencyRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_timeZoneRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_monthRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_colorRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_seasonRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jobject JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_structRoundTrip(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
JNIEXPORT jboolean JNICALL
Java_com_example_kotlinsmoke_UseKotlinExternalTypes_veryBooleanUnbox(JNIEnv* _jenv, jobject _jinstance, jobject jinput);



#ifdef __cplusplus
}
#endif
