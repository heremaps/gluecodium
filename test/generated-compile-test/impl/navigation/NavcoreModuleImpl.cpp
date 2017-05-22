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

#include "NavcoreModuleImpl.h"
#include "guidance/GuidanceImpl.h"

namespace navigation {

namespace internal {

std::string NavcoreModuleImpl::getVersion() const
{
}

std::string NavcoreModuleImpl::getName() const
{
}

NavcoreModuleStub::CreateGuidanceExpected NavcoreModuleImpl::createGuidance()
{
    return NavcoreModuleStub::CreateGuidanceExpected::result(
                std::unique_ptr<navigation::guidance::internal::GuidanceImpl>(new navigation::guidance::internal::GuidanceImpl()));
}

} // namespace internal

} // namespace navigation
