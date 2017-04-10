#include "RuntimeImpl.h"

namespace navigation {

RuntimeStub::CreateRuntimeDefaultsExpected RuntimeStub::createRuntimeDefaults(  )
{
    auto runtime = std::make_shared<internal::RuntimeImpl>();

    return RuntimeStub::CreateRuntimeDefaultsExpected::result(runtime);
}

RuntimeStub::CreateRuntimeWithConfigExpected RuntimeStub::createRuntimeWithConfig( const std::string& configFile )
{
    auto runtime = std::make_shared<internal::RuntimeImpl>();

    return RuntimeStub::CreateRuntimeWithConfigExpected::result(runtime);
}

RuntimeStub::CreateRuntimeFullExpected RuntimeStub::createRuntimeFull( const std::string& configFile, const std::string& initialProfile, const std::string& initialLanguage )
{
    auto runtime = std::make_shared<internal::RuntimeImpl>();

    return RuntimeStub::CreateRuntimeFullExpected::result(runtime);
}

namespace internal {

NavigationTypes::ErrorCode RuntimeImpl::shutdown()
{
}

RuntimeStub::ShutdownCompletedExpected RuntimeImpl::shutdownCompleted() const
{
}

NavigationTypes::ErrorCode RuntimeImpl::resume()
{
}

NavigationTypes::ErrorCode RuntimeImpl::stop()
{
}

NavigationTypes::ErrorCode RuntimeImpl::registerModuleFactory(
        const std::shared_ptr<ModuleFactoryStub> &moduleFactory)
{
    if (moduleFactory == nullptr) {
        return NavigationTypes::ErrorCode::UNKNOWN; // Invalid arguments
    }
    m_factories.push_back( moduleFactory );
    return NavigationTypes::ErrorCode::NONE;
}

RuntimeStub::CreateModuleExpected RuntimeImpl::createModule(const std::string &name)
{
    for (auto factory : m_factories) {
        if (factory->getName() == name) {
            return RuntimeStub::CreateModuleExpected::result(
                        std::shared_ptr<ModuleStub>(factory->createModule().get_result())
                        );
        }
    }

    return RuntimeStub::CreateModuleExpected::fail(NavigationTypes::ErrorCode::UNKNOWN); // Not found
}

std::shared_ptr<ProfileManagerStub> RuntimeImpl::getProfileManager() const
{
}

std::shared_ptr<SystemInformationStub> RuntimeImpl::getSystemInformation() const
{
}

std::shared_ptr<NetworkConfigurationStub> RuntimeImpl::getNetworkConfiguration() const
{
}

std::string RuntimeImpl::getVersion() const
{
}

std::string RuntimeImpl::getApplicationId() const
{
}

std::string RuntimeImpl::getApplicationCode() const
{
}

std::string RuntimeImpl::getBrandVariant() const
{
}

void RuntimeImpl::setBrandVariant(const std::string &brandVariant)
{
}

int16_t RuntimeImpl::getRestrictedSetId() const
{
}

void RuntimeImpl::setRestrictedSetId(const int16_t restrictedSetId)
{
}

NavigationTypes::CountryCode RuntimeImpl::getPoliticalMapView() const
{
}

void RuntimeImpl::setPoliticalMapView(const NavigationTypes::CountryCode &politicalMapView)
{
}

NavigationTypes::Language RuntimeImpl::getLanguage() const
{
    return "foo";
}

void RuntimeImpl::setLanguage(const NavigationTypes::Language &language)
{
    notifyLanguageChanged(language);
}

} // internal

} // navigation
