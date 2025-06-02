/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL
Java_com_example_smoke_KotlinMethodOverloads_three__Ljava_lang_String_2(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT void JNICALL
Java_com_example_smoke_KotlinMethodOverloads_three__Ljava_util_List_2(JNIEnv* _jenv, jobject _jinstance, jobject jinput);



#ifdef __cplusplus
}
#endif
