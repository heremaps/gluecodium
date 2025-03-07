/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT jlong JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_create(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jdouble JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_some_1method(JNIEnv* _jenv, jobject _jinstance, jobject jsomeArgument);

JNIEXPORT jlong JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_get_1int_1property(JNIEnv* _jenv, jobject _jinstance);

JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_set_1int_1property(JNIEnv* _jenv, jobject _jinstance, jlong jvalue);


JNIEXPORT jboolean JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_is_1boolean_1property(JNIEnv* _jenv, jobject _jinstance);

JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_set_1boolean_1property(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue);


JNIEXPORT jobject JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_get_1struct_1property(JNIEnv* _jenv, jobject _jinstance);

JNIEXPORT void JNICALL
Java_com_example_namerules_NAME_1RULES_1KT_set_1struct_1property(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);




#ifdef __cplusplus
}
#endif
