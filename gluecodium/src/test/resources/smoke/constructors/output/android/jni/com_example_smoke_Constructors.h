/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Constructors_create__(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Constructors_create__Lcom_example_smoke_Constructors_2(JNIEnv* _jenv, jobject _jinstance, jobject jother);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Constructors_create__Ljava_lang_String_2J(JNIEnv* _jenv, jobject _jinstance, jstring jfoo, jlong jbar);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Constructors_create__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Constructors_create__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput);
#ifdef __cplusplus
}
#endif
