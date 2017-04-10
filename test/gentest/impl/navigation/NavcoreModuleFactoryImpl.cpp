#include "NavcoreModuleFactoryImpl.h"
#include "NavcoreModuleImpl.h"

namespace navigation {

NavcoreModuleFactoryStub::CreateExpected NavcoreModuleFactoryStub::create()
{
    return NavcoreModuleFactoryStub::CreateExpected::result(std::make_shared<internal::NavcoreModuleFactoryImpl>());
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
    return CreateModuleExpected::result(std::static_pointer_cast<ModuleStub>(std::make_shared<NavcoreModuleImpl>()));
}

} // namespace internal

} // namespace navigation

