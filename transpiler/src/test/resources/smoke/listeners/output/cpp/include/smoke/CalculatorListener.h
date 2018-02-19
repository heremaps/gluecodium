// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <vector>

namespace smoke {

class CalculatorListener {
public:
    virtual ~CalculatorListener() = 0;

public:
struct ResultStruct {
    double result;
};

public:
virtual void on_calculation_result( const double calculation_result ) = 0;
virtual void on_calculation_result_const( const double calculation_result ) const = 0;
virtual void on_calculation_result_struct( const ::smoke::CalculatorListener::ResultStruct& calculation_result ) = 0;
virtual void on_calculation_result_array( const ::std::vector< double >& calculation_result ) = 0;
};

}
