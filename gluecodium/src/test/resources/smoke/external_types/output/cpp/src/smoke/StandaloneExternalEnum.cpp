// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#include "foo/Bar.h"
namespace smoke {
static_assert(std::is_enum<StandaloneExternalEnum>::value, "Expected 'StandaloneExternalEnum' to be an enumeration'.");
static_assert(
    0 == static_cast<int64_t>(StandaloneExternalEnum::foo),
    "Expected '0' value for 'StandaloneExternalEnum::foo'."
);
}
