// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>
#include <string>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT SpecialNames {
public:
    SpecialNames();
    virtual ~SpecialNames();


public:
    virtual void create(  ) = 0;
    virtual void release(  ) = 0;
    virtual void create_proxy(  ) = 0;
    virtual void _uppercase(  ) = 0;
    /**
     *
     * \param[in] result
     * \return @NotNull
     */
    static ::std::shared_ptr< ::smoke::SpecialNames > make( const ::std::string& result );
};


}
