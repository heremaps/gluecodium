// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "stub/navigation/RuntimeStub.h"
#include "stub/navigation/NavcoreModuleFactoryStub.h"
#include "stub/navigation/NavcoreModuleStub.h"
#include "stub/navigation/guidance/GuidanceStub.h"

#include <iostream>
#include <memory>

bool testStubImpl()
{
    using namespace navigation;
    using namespace navigation::NavigationTypes;
    using namespace navigation::guidance;

    auto createdRuntime = RuntimeStub::createRuntimeWithConfig("foo/bar.json");

    if (createdRuntime) {
        auto runtime = createdRuntime.take_result();

        auto registerError = runtime->registerModuleFactory(NavcoreModuleFactoryStub::create().take_result());
        if (registerError != ErrorCode::None) {
            std::cerr << "Failed registerModuleFactory" << " (" << (int)registerError << ")" << std::endl;
            return false;
        }

        auto createdModule = runtime->createModule("navcore");
        if (!createdModule) {
            std::cerr << "Failed createModule" << " (" << (int)createdModule.get_error() << ")" << std::endl;
            return false;
        }

        std::unique_ptr<ModuleStub> module = createdModule.take_result();
        auto createdGuidance = static_cast<NavcoreModuleStub*>(module.get())->createGuidance(); // this is not nice, we need to rethink module creation
        if (!createdGuidance) {
            std::cerr << "Failed createGuidance" << " (" << (int)createdGuidance.get_error() << ")" << std::endl;
            return false;
        }

        auto guidance = createdGuidance.take_result();

        auto opt = guidance->checkForOptimalTtaRoute();
        std::cout << (int)opt << std::endl;

        auto getAllManeuversResult = guidance->getAllManeuvers();
        if (!getAllManeuversResult) {
            std::cerr << "Failed getAllManeuvers" << " (" << (int)getAllManeuversResult.get_error() << ")" << std::endl;
            return false;
        }

        std::cout << getAllManeuversResult.get_result().size() << std::endl;

        return true;
    }

    return false;
}

int main()
{
    testStubImpl();

    return 0;
}
