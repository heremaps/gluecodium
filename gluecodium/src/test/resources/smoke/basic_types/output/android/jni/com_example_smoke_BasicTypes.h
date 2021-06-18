#include <jni.h>
#ifdef __cplusplus
extern "C" {
#endif
JNIEXPORT jstring JNICALL
Java_com_example_smoke_BasicTypes_stringFunction(JNIEnv* _jenv, jobject _jinstance, jstring jinput);
JNIEXPORT jboolean JNICALL
Java_com_example_smoke_BasicTypes_boolFunction(JNIEnv* _jenv, jobject _jinstance, jboolean jinput);
JNIEXPORT jfloat JNICALL
Java_com_example_smoke_BasicTypes_floatFunction(JNIEnv* _jenv, jobject _jinstance, jfloat jinput);
JNIEXPORT jdouble JNICALL
Java_com_example_smoke_BasicTypes_doubleFunction(JNIEnv* _jenv, jobject _jinstance, jdouble jinput);
JNIEXPORT jbyte JNICALL
Java_com_example_smoke_BasicTypes_byteFunction(JNIEnv* _jenv, jobject _jinstance, jbyte jinput);
JNIEXPORT jshort JNICALL
Java_com_example_smoke_BasicTypes_shortFunction(JNIEnv* _jenv, jobject _jinstance, jshort jinput);
JNIEXPORT jint JNICALL
Java_com_example_smoke_BasicTypes_intFunction(JNIEnv* _jenv, jobject _jinstance, jint jinput);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_BasicTypes_longFunction(JNIEnv* _jenv, jobject _jinstance, jlong jinput);
JNIEXPORT jshort JNICALL
Java_com_example_smoke_BasicTypes_ubyteFunction(JNIEnv* _jenv, jobject _jinstance, jshort jinput);
JNIEXPORT jint JNICALL
Java_com_example_smoke_BasicTypes_ushortFunction(JNIEnv* _jenv, jobject _jinstance, jint jinput);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_BasicTypes_uintFunction(JNIEnv* _jenv, jobject _jinstance, jlong jinput);
JNIEXPORT jlong JNICALL
Java_com_example_smoke_BasicTypes_ulongFunction(JNIEnv* _jenv, jobject _jinstance, jlong jinput);
#ifdef __cplusplus
}
#endif
