// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/Errors.h"

namespace smoke {

Errors::~Errors() = default;

std::error_code
make_error_code( ::smoke::Errors::InternalError value ) noexcept
{
    return std::error_code( static_cast<int>( value ), std::generic_category( ) );
}

}
