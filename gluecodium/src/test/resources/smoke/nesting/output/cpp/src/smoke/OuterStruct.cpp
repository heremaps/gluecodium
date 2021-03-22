// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "smoke/OuterStruct.h"
#include <string>
#include <utility>
namespace smoke {
OuterStruct::InnerStruct::InnerStruct( )
    : other_field{ }
{
}
OuterStruct::InnerStruct::InnerStruct( ::std::vector< ::std::chrono::system_clock::time_point > other_field )
    : other_field( std::move( other_field ) )
{
}
OuterStruct::InnerClass::InnerClass() {
}
OuterStruct::InnerClass::~InnerClass() {
}
OuterStruct::Builder::Builder() {
}
OuterStruct::Builder::~Builder() {
}
OuterStruct::InnerInterface::InnerInterface() {
}
OuterStruct::InnerInterface::~InnerInterface() {
}
OuterStruct::OuterStruct( )
    : field{ }
{
}
OuterStruct::OuterStruct( ::std::string field )
    : field( std::move( field ) )
{
}
std::error_code
make_error_code( ::smoke::OuterStruct::InnerEnum value ) noexcept
{
    class InnerEnumErrorCategory: public ::std::error_category
    {
    public:
        ~InnerEnumErrorCategory( ) override = default;
        const char*
        name( ) const noexcept override
        {
            return "InnerEnumErrorCategory";
        }
        std::string
        message( int condition ) const override
        {
            switch( ::smoke::OuterStruct::InnerEnum( condition ) )
            {
            case( ::smoke::OuterStruct::InnerEnum::FOO ):
                return "::smoke::OuterStruct::InnerEnum::FOO";
            case( ::smoke::OuterStruct::InnerEnum::BAR ):
                return "::smoke::OuterStruct::InnerEnum::BAR";
            }
            return "Unknown enum value";
        }
    };
    static InnerEnumErrorCategory category{};
    return std::error_code( static_cast<int>( value ), category );
}
}
