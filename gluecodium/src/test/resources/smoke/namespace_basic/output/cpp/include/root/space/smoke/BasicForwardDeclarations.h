// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <memory>

namespace root {
namespace space {

namespace smoke {

    class Basic;


}
}
}

namespace root {
namespace space {
namespace smoke {
class _GLUECODIUM_CPP_EXPORT BasicForwardDeclarations {
public:
    BasicForwardDeclarations();
    virtual ~BasicForwardDeclarations();


public:
    /**
     *
     * \return @NotNull
     */
    virtual ::std::shared_ptr< ::root::space::smoke::Basic > use_basic(  ) = 0;
};


}
}
}
