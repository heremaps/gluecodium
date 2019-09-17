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
        std::remove_cv<std::remove_reference<decltype(((::foo::BarClass*)nullptr)->doStuff(
            *((int32_t*)nullptr)))>::type>::type
    >::value,
    "Expected '::std::string' return type for '::foo::BarClass::doStuff'."
);
static_assert(
    std::is_same<
        ::foo::BarEnum,
        std::remove_cv<std::remove_reference<decltype(::foo::BarClass::doStaticStuff(
            *((::foo::BarEnum*)nullptr)))>::type>::type
    >::value,
    "Expected '::foo::BarEnum' return type for '::foo::BarClass::doStaticStuff'."
);
}