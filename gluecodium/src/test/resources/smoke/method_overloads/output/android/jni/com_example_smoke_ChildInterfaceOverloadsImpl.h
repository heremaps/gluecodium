/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_foo__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_bar__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_foo__(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_foo__I(JNIEnv* _jenv, jobject _jinstance, jint jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_bar(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildInterfaceOverloadsImpl_baz(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
