// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "Export.h"
#include "examples/CalculatorListener.h"
#include <memory>
namespace examples {
    class CalculatorListener;
}
namespace examples {
class _GENIUM_CPP_EXPORT Calculator {
public:
    virtual ~Calculator() = 0;
public:
/**
 *
 * \param[in] listener @NotNull
 */
static void register_listener( const ::std::shared_ptr< ::examples::CalculatorListener >& listener );
/**
 *
 * \param[in] listener @NotNull
 */
static void unregister_listener( const ::std::shared_ptr< ::examples::CalculatorListener >& listener );
static void calculate(  );
};
}
