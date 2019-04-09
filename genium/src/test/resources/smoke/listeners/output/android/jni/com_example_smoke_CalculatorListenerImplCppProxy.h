/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
#pragma once
#include <jni.h>
#include "JniReference.h"
#include "smoke/CalculatorListener.h"
#include "com_example_smoke_CalculatorListenerImpl.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#ifdef __cplusplus
extern "C" {
#endif
namespace smoke {
class CalculatorListenerCppProxy : public ::genium::jni::CppProxyBase, public CalculatorListener {
public:
    CalculatorListenerCppProxy( JNIEnv* _jenv, ::genium::jni::JniReference<jobject> globalRef, jint _jHashCode );
    void on_calculation_result( const double ncalculationResult ) override;
    void on_calculation_result_const( const double ncalculationResult ) const override;
    void on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) override;
    void on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) override;
    void on_calculation_result_map( const ::smoke::CalculatorListener::NamedCalculationResults& ncalculationResults ) override;
    void on_calculation_result_instance( const ::std::shared_ptr< ::smoke::CalculationResult >& ncalculationResult ) override;
};
}
#ifdef __cplusplus
}
#endif
