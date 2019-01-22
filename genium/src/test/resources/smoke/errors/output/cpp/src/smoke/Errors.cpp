// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------

#include "smoke/Errors.h"
#include <string>

namespace smoke {

Errors::~Errors() = default;

std::error_code
make_error_code( ::smoke::Errors::InternalError value ) noexcept
{
    class InternalErrorErrorCategory: public ::std::error_category
    {
    public:
        ~InternalErrorErrorCategory( ) override = default;
        const char*
        name( ) const noexcept override
        {
            return "InternalErrorErrorCategory";
        }
        std::string
        message( int condition ) const override
        {
            switch( ::smoke::Errors::InternalError( condition ) )
            {
            case( ::smoke::Errors::InternalError::ERROR_NONE ):
                return "::smoke::Errors::InternalError::ERROR_NONE";
            case( ::smoke::Errors::InternalError::ERROR_FATAL ):
                return "::smoke::Errors::InternalError::ERROR_FATAL";
            }
            return "Unknown enum value";
        }
    };
    static InternalErrorErrorCategory category{};
    return std::error_code( static_cast<int>( value ), category );
}

}
