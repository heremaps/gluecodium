// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include <string>
namespace examples {
class _GLUECODIUM_CPP_EXPORT InheritanceParent {
public:
    InheritanceParent();
    virtual ~InheritanceParent() = 0;
public:
    virtual ::std::string parent_method( const ::std::string& input ) = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::examples::InheritanceParent*);
}