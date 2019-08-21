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
namespace examples {
class _GENIUM_CPP_EXPORT InheritanceParent {
public:
    InheritanceParent();
    virtual ~InheritanceParent() = 0;
public:
virtual ::std::string parent_method( const ::std::string& input ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::InheritanceParent*);
}