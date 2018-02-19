// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "ErrorCode.h"
#include "Return.h"
#include <string>

namespace examples {

class Errors {
public:
    virtual ~Errors() = 0;

public:
enum class InternalErrors {
    NONE,
    CRASHED,
    EXPLODED
};

public:
static ::hf::ErrorCode start_something_or_fail(  );
static ::hf::Return< ::std::string, ::hf::ErrorCode > get_something_or_fail(  );
};

}
