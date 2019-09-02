// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/TypeRepository.h"
namespace package {
class _GENIUM_CPP_EXPORT Interface {
public:
    Interface();
    virtual ~Interface() = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::package::Interface*);
}