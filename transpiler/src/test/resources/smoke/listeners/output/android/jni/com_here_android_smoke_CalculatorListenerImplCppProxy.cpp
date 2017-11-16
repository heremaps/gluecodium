
#include "android/jni/com_here_android_smoke_CalculatorListenerImplCppProxy.h"

#include "android/jni/InstanceConversion.h"
#include "android/jni/StructConversion.h"
#include "android/jni/ArrayConversionUtils.h"
#include "android/jni/EnumConversion.h"

namespace smoke {


using namespace ::here::internal;

CalculatorListenerCppProxy::CalculatorListenerCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )
    : CppProxyBase( _jenv, _jobj, _jHashCode ) {
}

void CalculatorListenerCppProxy::on_calculation_result( const double ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod( "onCalculationResult", "(D)V", jniEnv , jcalculationResult);
}

}
