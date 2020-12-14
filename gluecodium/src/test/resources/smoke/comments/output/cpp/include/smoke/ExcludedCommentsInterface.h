// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
namespace smoke {
/**
 * This is some very useful interface.
 * \private
 */
class _GLUECODIUM_CPP_EXPORT ExcludedCommentsInterface {
public:
    ExcludedCommentsInterface();
    virtual ~ExcludedCommentsInterface() = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::ExcludedCommentsInterface*);
}
