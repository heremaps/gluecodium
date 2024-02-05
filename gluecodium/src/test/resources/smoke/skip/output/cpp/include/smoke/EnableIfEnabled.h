// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"

namespace smoke {
class _GLUECODIUM_CPP_EXPORT EnableIfEnabled {
public:
    EnableIfEnabled();
    virtual ~EnableIfEnabled();


public:
    static void enable_if_unquoted(  );
    static void enable_if_unquoted_list(  );
    static void enable_if_quoted(  );
    static void enable_if_quoted_list(  );
    static void enable_if_tagged(  );
    static void enable_if_tagged_list(  );
    static void enable_if_mixed_list(  );
};


}
