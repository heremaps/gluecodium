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
#include "smoke/ParentInterface.h"
namespace smoke {
class _GENIUM_CPP_EXPORT ChildClassFromInterface: public ::smoke::ParentInterface {
public:
    ChildClassFromInterface();
    virtual ~ChildClassFromInterface() = 0;
public:
virtual void child_class_method(  ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::ChildClassFromInterface*);
}