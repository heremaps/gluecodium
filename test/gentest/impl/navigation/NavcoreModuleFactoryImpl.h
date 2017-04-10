#pragma once

#include "stub/navigation/NavcoreModuleFactoryStub.h"

namespace navigation {

namespace internal {

class NavcoreModuleFactoryImpl : public NavcoreModuleFactoryStub
{
    // ModuleFactoryStub interface
public:
    std::string getModuleVersion() const override;
    std::string getName() const override;

    CreateModuleExpected createModule() override;
};

}

}
