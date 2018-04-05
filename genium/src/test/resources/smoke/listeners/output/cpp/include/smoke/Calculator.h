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
static void register_listener( const ::std::shared_ptr< ::smoke::CalculatorListener >& listener );
static void unregister_listener( const ::std::shared_ptr< ::smoke::CalculatorListener >& listener );

};

}
