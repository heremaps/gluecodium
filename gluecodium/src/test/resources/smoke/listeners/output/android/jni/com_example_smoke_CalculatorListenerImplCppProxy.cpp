/*
 *
 */
#include "com_example_smoke_CalculationResult__Conversion.h"
#include "com_example_smoke_CalculatorListenerImplCppProxy.h"
#include "com_example_smoke_CalculatorListener_ResultStruct__Conversion.h"
#include "com_example_smoke_CalculatorListener__Conversion.h"
#include "ArrayConversionUtils.h"
#include "FieldAccessMethods.h"
namespace gluecodium
{
namespace jni
{
com_example_smoke_CalculatorListenerImpl_CppProxy::com_example_smoke_CalculatorListenerImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode )
    : CppProxyBase( _jenv, std::move( globalRef ), _jHashCode, "com_example_smoke_CalculatorListenerImpl" ) {
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result( const double ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod<void>( "onCalculationResult", "(D)V", jniEnv , jcalculationResult);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result_const( const double ncalculationResult ) const {
    JNIEnv* jniEnv = getJniEnvironment( );
    jdouble jcalculationResult = ncalculationResult;
    callJavaMethod<void>( "onCalculationResultConst", "(D)V", jniEnv , jcalculationResult);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultStruct", "(Lcom/example/smoke/CalculatorListener$ResultStruct;)V", jniEnv , jcalculationResult);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultArray", "(Ljava/util/List;)V", jniEnv , jcalculationResult);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result_map( const ::smoke::CalculatorListener::NamedCalculationResults& ncalculationResults ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResults = convert_to_jni( jniEnv, ncalculationResults );
    callJavaMethod<void>( "onCalculationResultMap", "(Ljava/util/Map;)V", jniEnv , jcalculationResults);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
void
com_example_smoke_CalculatorListenerImpl_CppProxy::on_calculation_result_instance( const ::std::shared_ptr< ::smoke::CalculationResult >& ncalculationResult ) {
    JNIEnv* jniEnv = getJniEnvironment( );
    auto jcalculationResult = convert_to_jni( jniEnv, ncalculationResult );
    callJavaMethod<void>( "onCalculationResultInstance", "(Lcom/example/smoke/CalculationResult;)V", jniEnv , jcalculationResult);
    if ( jniEnv->ExceptionCheck( ) )
    {
        jniEnv->ExceptionDescribe( );
        jniEnv->ExceptionClear( );
        jniEnv->FatalError( "Exception was thrown in Java and it was not handled.\n"
            "See the log for more information about the exception (including Java stack trace)." );
    }
}
}
}
