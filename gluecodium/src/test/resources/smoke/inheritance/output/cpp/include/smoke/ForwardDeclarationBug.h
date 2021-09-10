// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "smoke/ParentClass.h"
#include <memory>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT ForwardDeclarationBug: public ::smoke::ParentClass {
public:
    ForwardDeclarationBug();
    virtual ~ForwardDeclarationBug() = 0;
public:
    /**
     *
     * \param[in] bar @NotNull
     */
    virtual void foo( const ::std::shared_ptr< ::smoke::ParentClass >& bar ) = 0;
};
}
