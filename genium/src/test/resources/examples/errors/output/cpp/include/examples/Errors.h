// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "Return.h"
#include <string>
#include <system_error>

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
static ::std::error_code start_something_or_fail(  );
static ::genium::Return< ::std::string, ::std::error_code > get_something_or_fail(  );
};

}
