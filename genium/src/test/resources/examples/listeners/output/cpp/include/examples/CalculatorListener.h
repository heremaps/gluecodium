// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
namespace examples {
class _GENIUM_CPP_EXPORT CalculatorListener {
public:
    CalculatorListener();
    virtual ~CalculatorListener() = 0;
public:
virtual void on_calculation_result( const double calculation_result ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::CalculatorListener*);
}