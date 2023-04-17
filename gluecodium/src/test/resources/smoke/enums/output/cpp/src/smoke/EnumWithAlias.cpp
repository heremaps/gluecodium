// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/EnumWithAlias.h"
#include <string>
namespace smoke {
std::error_code
make_error_code( ::smoke::EnumWithAlias value ) noexcept
{
    class EnumWithAliasErrorCategory: public ::std::error_category
    {
    public:
        ~EnumWithAliasErrorCategory( ) override = default;
        const char*
        name( ) const noexcept override
        {
            return "EnumWithAliasErrorCategory";
        }
        std::string
        message( int condition ) const override
        {
            switch( ::smoke::EnumWithAlias( condition ) )
            {
            case( ::smoke::EnumWithAlias::ONE ):
                return "::smoke::EnumWithAlias::ONE";
            case( ::smoke::EnumWithAlias::TWO ):
                return "::smoke::EnumWithAlias::TWO";
            case( ::smoke::EnumWithAlias::THREE ):
                return "::smoke::EnumWithAlias::THREE";
            }
            return "Unknown enum value";
        }
    };
    static EnumWithAliasErrorCategory category{};
    return std::error_code( static_cast<int>( value ), category );
}
}
