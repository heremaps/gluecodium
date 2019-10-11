// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/Errors.h"
#include <string>
namespace smoke {
Errors::Errors() {
}
Errors::~Errors() {
}
static_assert(std::is_enum<::fire::SomeEnum>::value, "Expected '::fire::SomeEnum' to be an enumeration'.");
static_assert(
    0 == static_cast<int64_t>(::fire::SomeEnum::NONE),
    "Expected '0' value for '::fire::SomeEnum::NONE'."
);
static_assert(
    1 == static_cast<int64_t>(::fire::SomeEnum::BOOM),
    "Expected '1' value for '::fire::SomeEnum::BOOM'."
);
static_assert(
    2 == static_cast<int64_t>(::fire::SomeEnum::BUST),
    "Expected '2' value for '::fire::SomeEnum::BUST'."
);
std::error_code
make_error_code( ::smoke::Errors::InternalErrorCode value ) noexcept
{
    class InternalErrorCodeErrorCategory: public ::std::error_category
    {
    public:
        ~InternalErrorCodeErrorCategory( ) override = default;
        const char*
        name( ) const noexcept override
        {
            return "InternalErrorCodeErrorCategory";
        }
        std::string
        message( int condition ) const override
        {
            switch( ::smoke::Errors::InternalErrorCode( condition ) )
            {
            case( ::smoke::Errors::InternalErrorCode::ERROR_NONE ):
                return "::smoke::Errors::InternalErrorCode::ERROR_NONE";
            case( ::smoke::Errors::InternalErrorCode::ERROR_FATAL ):
                return "::smoke::Errors::InternalErrorCode::ERROR_FATAL";
            }
            return "Unknown enum value";
        }
    };
    static InternalErrorCodeErrorCategory category{};
    return std::error_code( static_cast<int>( value ), category );
}
}
