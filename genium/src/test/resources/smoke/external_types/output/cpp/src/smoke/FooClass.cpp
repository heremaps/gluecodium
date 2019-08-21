// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#include "smoke/FooClass.h"
#include <type_traits>
namespace genium {
}
namespace smoke {
static_assert(std::is_same<
    ::std::string,
    typename std::result_of<decltype(&::foo::BarClass::doStuff)(::foo::BarClass*, const int32_t)>::type
>::value);static_assert(std::is_same<
    ::foo::BarEnum,
    typename std::result_of<decltype(&::foo::BarClass::doStaticStuff)(const ::foo::BarEnum)>::type
>::value);
}
