/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_foo__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_bar__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_foo__(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_foo__I(JNIEnv* _jenv, jobject _jinstance, jint jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_bar(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_ChildClassFromInterfaceOverloads_baz(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
