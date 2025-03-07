/*

 *
 */

#pragma once

#include "smoke/CalculatorListener.h"
#include "CppProxyBase.h"
#include "JniReference.h"

namespace gluecodium
{
namespace jni
{

class com_example_smoke_CalculatorListener_CppProxy final : public CppProxyBase, public ::smoke::CalculatorListener {
public:
    com_example_smoke_CalculatorListener_CppProxy( JniReference<jobject> globalRef, jint _jHashCode ) noexcept;
    com_example_smoke_CalculatorListener_CppProxy( const com_example_smoke_CalculatorListener_CppProxy& ) = delete;
    com_example_smoke_CalculatorListener_CppProxy& operator=( const com_example_smoke_CalculatorListener_CppProxy& ) = delete;


    void on_calculation_result( const double ncalculationResult ) override;

    void on_calculation_result_const( const double ncalculationResult ) const override;

    void on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& ncalculationResult ) override;

    void on_calculation_result_array( const ::std::vector< double >& ncalculationResult ) override;

    void on_calculation_result_map( const ::smoke::CalculatorListener::NamedCalculationResults& ncalculationResults ) override;

    void on_calculation_result_instance( const ::std::shared_ptr< ::smoke::CalculationResult >& ncalculationResult ) override;
};

}
}
