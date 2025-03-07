/*

 *
 */

#pragma once

#include <jni.h>

#ifdef __cplusplus
extern "C" {
#endif

JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResult(JNIEnv* _jenv, jobject _jinstance, jdouble jcalculationResult);
JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultConst(JNIEnv* _jenv, jobject _jinstance, jdouble jcalculationResult);
JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultStruct(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult);
JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultArray(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult);
JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultMap(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResults);
JNIEXPORT void JNICALL
Java_com_example_smoke_CalculatorListenerImpl_onCalculationResultInstance(JNIEnv* _jenv, jobject _jinstance, jobject jcalculationResult);



#ifdef __cplusplus
}
#endif
