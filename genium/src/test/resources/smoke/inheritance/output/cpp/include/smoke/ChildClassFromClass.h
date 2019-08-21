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
#include "smoke/ParentClass.h"
namespace smoke {
class _GENIUM_CPP_EXPORT ChildClassFromClass: public ::smoke::ParentClass {
public:
    ChildClassFromClass();
    virtual ~ChildClassFromClass() = 0;
public:
virtual void child_class_method(  ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::ChildClassFromClass*);
}