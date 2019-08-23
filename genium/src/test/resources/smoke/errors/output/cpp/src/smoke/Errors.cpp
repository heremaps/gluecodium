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
namespace genium {
TypeRepository& get_type_repository(const ::smoke::Errors*) {
    static TypeRepository s_repo;
    return s_repo;
}
}
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
namespace genium {
std::size_t
hash< ::smoke::Errors::InternalError >::operator( )( const ::smoke::Errors::InternalError& t ) const
{
    return static_cast< std::size_t >( t );
}
}
