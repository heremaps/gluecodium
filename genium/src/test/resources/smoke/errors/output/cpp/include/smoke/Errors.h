// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#pragma once

#include <system_error>

namespace smoke {

class Errors {
public:
    virtual ~Errors() = 0;
public:
enum class InternalError {
    ERROR_NONE,
    ERROR_FATAL
};

public:
static ::std::error_code method_with_errors(  );
};

}
