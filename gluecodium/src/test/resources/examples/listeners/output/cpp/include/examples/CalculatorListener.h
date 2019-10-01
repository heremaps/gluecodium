// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
namespace examples {
class _GLUECODIUM_CPP_EXPORT CalculatorListener {
public:
    CalculatorListener();
    virtual ~CalculatorListener() = 0;
public:
    virtual void on_calculation_result( const double calculation_result ) = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::CalculatorListener*);
}