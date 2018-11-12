
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"

#include "InstanceConversion.h"
#include "StructConversion.h"
#include "ArrayConversionUtils.h"
#include "EnumConversion.h"

namespace smoke {


using namespace ::genium::jni;

CalculatorListenerCppProxy::CalculatorListenerCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )
    : CppProxyBase( _jenv, _jobj, _jHashCode ) {
}

void CalculatorListenerCppProxy::on_calculation_result( const double ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod<void>( "onCalculationResult", "(D)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_const( const double ncalculationResult ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod<void>( "onCalculationResultConst", "(D)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultStruct", "(Lcom/example/smoke/CalculatorListener$ResultStruct;)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultArray", "(Ljava/util/List;)V", jniEnv , jcalculationResult);
}

void CalculatorListenerCppProxy::on_calculation_result_map( const ::smoke::CalculatorListener::NamedCalculationResults& ncalculationResults ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResults = convert_to_jni( jniEnv, ncalculationResults );
    callJavaMethod<void>( "onCalculationResultMap", "(Ljava/util/Map;)V", jniEnv , jcalculationResults);
}

void CalculatorListenerCppProxy::on_calculation_result_instance( const ::std::shared_ptr< ::smoke::CalculationResult >& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultInstance", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jcalculationResult);
}

}
