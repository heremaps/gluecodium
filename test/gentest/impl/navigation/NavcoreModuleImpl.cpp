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
                std::make_shared<navigation::guidance::internal::GuidanceImpl>());
}

} // namespace internal

} // namespace navigation

