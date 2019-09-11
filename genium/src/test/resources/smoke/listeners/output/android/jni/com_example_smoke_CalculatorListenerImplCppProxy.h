/*
 *
 */
#pragma once
#include <jni.h>
#include "JniReference.h"
#include "smoke/CalculatorListener.h"
#include "CppProxyBase.h"
#include "FieldAccessMethods.h"
#include "JniBase.h"
#include "JniCppConversionUtils.h"
#include "com_example_smoke_CalculatorListenerImpl.h"
namespace genium
{
namespace jni
{
class CalculatorListenerImpl_CppProxy : public CppProxyBase, public ::smoke::CalculatorListener {
public:
    CalculatorListenerImpl_CppProxy( JNIEnv* _jenv, JniReference<jobject> globalRef, jint _jHashCode );
    void on_calculation_result( const double ncalculationResult ) override;
    void on_calculation_result_const( const double ncalculationResult ) const override;
    void on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) override;
    void on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) override;
    void on_calculation_result_map( const ::smoke::CalculatorListener::NamedCalculationResults& ncalculationResults ) override;
    void on_calculation_result_instance( const ::std::shared_ptr< ::smoke::CalculationResult >& ncalculationResult ) override;
};
}
}
