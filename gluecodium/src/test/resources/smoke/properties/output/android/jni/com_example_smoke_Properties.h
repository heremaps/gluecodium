/*
 *
 */
#pragma once
#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jlong JNICALL
Java_com_example_smoke_Properties_getBuiltInTypeProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setBuiltInTypeProperty(JNIEnv* _jenv, jobject _jinstance, jlong jvalue);
JNIEXPORT jfloat JNICALL
Java_com_example_smoke_Properties_getReadonlyProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Properties_getStructProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setStructProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Properties_getArrayProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setArrayProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Properties_getComplexTypeProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setComplexTypeProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
JNIEXPORT jbyteArray JNICALL
Java_com_example_smoke_Properties_getByteBufferProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setByteBufferProperty(JNIEnv* _jenv, jobject _jinstance, jbyteArray jvalue);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Properties_getInstanceProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setInstanceProperty(JNIEnv* _jenv, jobject _jinstance, jobject jvalue);
JNIEXPORT jboolean JNICALL
Java_com_example_smoke_Properties_isBooleanProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setBooleanProperty(JNIEnv* _jenv, jobject _jinstance, jboolean jvalue);
JNIEXPORT jstring JNICALL
Java_com_example_smoke_Properties_getStaticProperty(JNIEnv* _jenv, jobject _jinstance);
JNIEXPORT void JNICALL
Java_com_example_smoke_Properties_setStaticProperty(JNIEnv* _jenv, jobject _jinstance, jstring jvalue);
JNIEXPORT jobject JNICALL
Java_com_example_smoke_Properties_getStaticReadonlyProperty(JNIEnv* _jenv, jobject _jinstance);
#ifdef __cplusplus
}
#endif
