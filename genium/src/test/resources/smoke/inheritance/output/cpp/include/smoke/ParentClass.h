// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ParentClass {
public:
    ParentClass();
    virtual ~ParentClass() = 0;
public:
    virtual void root_method(  ) = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::ParentClass*);
}
