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

#pragma once

#include "stub/navigation/RuntimeStub.h"

#include <vector>
#include <memory>

namespace navigation {

namespace internal {

class RuntimeImpl : public RuntimeStub
{
    // RuntimeStub interface
public:
    NavigationTypes::ErrorCode shutdown() override;
    NavigationTypes::ErrorCode resume() override;
    NavigationTypes::ErrorCode stop() override;
    NavigationTypes::ErrorCode registerModuleFactory(const std::shared_ptr<ModuleFactoryStub> &moduleFactory) override;
    ShutdownCompletedExpected shutdownCompleted() const override;
    CreateModuleExpected createModule(const std::string &name) override;
    std::shared_ptr<ProfileManagerStub> getProfileManager() const override;
    std::shared_ptr<SystemInformationStub> getSystemInformation() const override;
    std::shared_ptr<NetworkConfigurationStub> getNetworkConfiguration() const override;
    std::string getVersion() const override;
    std::string getApplicationId() const override;
    std::string getApplicationCode() const override;
    std::string getBrandVariant() const override;
    void setBrandVariant(const std::string &brandVariant) override;
    int16_t getRestrictedSetId() const override;
    void setRestrictedSetId(const int16_t restrictedSetId) override;
    NavigationTypes::CountryCode getPoliticalMapView() const override;
    void setPoliticalMapView(const NavigationTypes::CountryCode &politicalMapView) override;
    NavigationTypes::Language getLanguage() const override;
    void setLanguage(const NavigationTypes::Language &language) override;

private:
    std::vector< std::shared_ptr< ModuleFactoryStub > > m_factories;
};

}

}
