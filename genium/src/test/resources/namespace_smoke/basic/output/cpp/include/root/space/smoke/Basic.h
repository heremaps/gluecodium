// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
#include <string>
namespace root {
namespace space {
namespace smoke {
class _GENIUM_CPP_EXPORT Basic {
public:
    Basic();
    virtual ~Basic() = 0;
public:
static ::std::string basic_method( const ::std::string& input_string );
};
}
}
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::root::space::smoke::Basic*);
}