
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"

#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"

namespace smoke {


using namespace ::transpiler::jni;

CalculatorListenerCppProxy::CalculatorListenerCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )
    : CppProxyBase( _jenv, _jobj, _jHashCode ) {
}

void CalculatorListenerCppProxy::on_calculation_result( const double ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod( "onCalculationResult", "(D)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_const( const double ncalculationResult ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod( "onCalculationResultConst", "(D)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod( "onCalculationResultStruct", "(Lcom/example/smoke/CalculatorListener$ResultStruct;)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod( "onCalculationResultArray", "(Ljava/util/List;)V", jniEnv , jcalculationResult);
}

}
