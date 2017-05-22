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

#include "NavcoreModuleFactoryImpl.h"
#include "NavcoreModuleImpl.h"

namespace navigation {

NavcoreModuleFactoryStub::CreateExpected NavcoreModuleFactoryStub::create()
{
    return NavcoreModuleFactoryStub::CreateExpected::result(std::unique_ptr<internal::NavcoreModuleFactoryImpl>(new internal::NavcoreModuleFactoryImpl()));
}

namespace internal {

std::string NavcoreModuleFactoryImpl::getModuleVersion() const
{
    return "0.0.0";
}

std::string NavcoreModuleFactoryImpl::getName() const
{
    return "navcore";
}

NavcoreModuleFactoryStub::CreateModuleExpected NavcoreModuleFactoryImpl::createModule()
{
    return CreateModuleExpected::result(std::unique_ptr<ModuleStub>(new NavcoreModuleImpl()));
}

} // namespace internal

} // namespace navigation
