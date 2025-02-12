// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT AsyncRenamed {
public:
    AsyncRenamed();
    virtual ~AsyncRenamed();


public:
    virtual void callDispose( std::function<void()> _result_callback ) = 0;

};


}
