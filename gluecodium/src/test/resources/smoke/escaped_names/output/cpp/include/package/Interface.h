// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
namespace package {
class _GLUECODIUM_CPP_EXPORT Interface {
public:
    Interface();
    virtual ~Interface() = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::package::Interface*);
}