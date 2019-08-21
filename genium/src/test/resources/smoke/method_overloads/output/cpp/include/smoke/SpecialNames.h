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
namespace smoke {
class _GENIUM_CPP_EXPORT SpecialNames {
public:
    SpecialNames();
    virtual ~SpecialNames() = 0;
public:
virtual void create(  ) = 0;
virtual void release(  ) = 0;
virtual void create_proxy(  ) = 0;
virtual void _uppercase(  ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::SpecialNames*);
}