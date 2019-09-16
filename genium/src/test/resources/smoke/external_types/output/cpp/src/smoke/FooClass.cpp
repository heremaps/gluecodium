// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "foo/Bar.h"
#include "genium/Export.h"
#include <cstdint>
#include <string>
namespace smoke {
static_assert(
    std::is_same<
        ::std::string,
        decltype(((::foo::BarClass*)nullptr)->doStuff(
            *((int32_t*)nullptr)))
    >::value,
    "Expected '::std::string' return type for '::foo::BarClass::doStuff'."
);
static_assert(
    std::is_same<
        ::foo::BarEnum,
        decltype(::foo::BarClass::doStaticStuff(
            *((::foo::BarEnum*)nullptr)))
    >::value,
    "Expected '::foo::BarEnum' return type for '::foo::BarClass::doStaticStuff'."
);
}