#pragma once

#include "stub/navigation/NavcoreModuleStub.h"

namespace navigation {

namespace internal {

class NavcoreModuleImpl : public NavcoreModuleStub
{

    // ModuleStub interface
public:
    std::string getVersion() const override;
    std::string getName() const override;

    // NavcoreModuleStub interface
public:
    CreateGuidanceExpected createGuidance() override;
};

}

}
