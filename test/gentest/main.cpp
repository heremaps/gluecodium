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

bool testStubImpl()
{
    using namespace navigation;
    using namespace navigation::NavigationTypes;
    using namespace navigation::guidance;

    RuntimeStub::CreateRuntimeWithConfigExpected re = RuntimeStub::createRuntimeWithConfig("foo/bar.json");

    if (re.succeeded()) {
        auto runtime = re.get_result();

        auto registerError = runtime->registerModuleFactory(NavcoreModuleFactoryStub::create().get_result());
        if (registerError != ErrorCode::None) {
            std::cerr << "Failed registerModuleFactory" << " (" << (int)registerError << ")" << std::endl;
            return false;
        }

        auto me = runtime->createModule("navcore");
        if (!me.succeeded()) {
            std::cerr << "Failed createModule" << " (" << (int)me.get_error() << ")" << std::endl;
            return false;
        }

        auto module = me.get_result();
        auto ge = std::static_pointer_cast<NavcoreModuleStub>(module)->createGuidance();
        if (!me.succeeded()) {
            std::cerr << "Failed createGuidance" << " (" << (int)ge.get_error() << ")" << std::endl;
            return false;
        }

        auto guidance = ge.get_result();

        auto opt = guidance->checkForOptimalTtaRoute();
        std::cout << (int)opt << std::endl;

        auto ae = guidance->getAllManeuvers();
        if (!ae.succeeded()) {
            std::cerr << "Failed createGuidance" << " (" << (int)ae.get_error() << ")" << std::endl;
            return false;
        }

        std::cout << ae.get_result().size() << std::endl;

        return true;
    }

    return false;
}

int main()
{
    testStubImpl();

    return 0;
}
