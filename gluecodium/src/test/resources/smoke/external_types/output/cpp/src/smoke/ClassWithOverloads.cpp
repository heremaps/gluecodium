// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "include/ExternalTypes.h"
#include <type_traits>
#include <utility>
namespace smoke {
static_assert(
    std::is_same<
        ::std::string,
        std::remove_cv<std::remove_reference<decltype(std::declval<::smoke::ClassWithOverloads>().oneOverloadNotExposed())>::type>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::ClassWithOverloads::oneOverloadNotExposed'."
);
static_assert(
    std::is_same<
        ::std::string,
        std::remove_cv<std::remove_reference<decltype(std::declval<::smoke::ClassWithOverloads>().allOverloadsExposed(
            *((::std::string*)nullptr)))>::type>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::ClassWithOverloads::allOverloadsExposed'."
);
static_assert(
    std::is_same<
        ::std::string,
        std::remove_cv<std::remove_reference<decltype(std::declval<::smoke::ClassWithOverloads>().allOverloadsExposed(
            *((::std::vector< ::std::string >*)nullptr)))>::type>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::ClassWithOverloads::allOverloadsExposed'."
);
static_assert(
    std::is_same<
        ::std::string,
        std::remove_cv<std::remove_reference<decltype(std::declval<::smoke::ClassWithOverloads>().allOverloadsExposed(
            *((::std::string*)nullptr),
            *((bool*)nullptr)))>::type>::type
    >::value,
    "Expected '::std::string' return type for '::smoke::ClassWithOverloads::allOverloadsExposed'."
);
}
