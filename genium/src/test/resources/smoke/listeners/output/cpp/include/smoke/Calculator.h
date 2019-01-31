// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "smoke/CalculatorListener.h"
#include <memory>
namespace smoke {
    class CalculatorListener;
}
namespace smoke {
class Calculator {
public:
    virtual ~Calculator() = 0;
public:
/**
 * \param[in] listener @NotNull
 */
static void register_listener( const ::std::shared_ptr< ::smoke::CalculatorListener >& listener );
/**
 * \param[in] listener @NotNull
 */
static void unregister_listener( const ::std::shared_ptr< ::smoke::CalculatorListener >& listener );
};
}
