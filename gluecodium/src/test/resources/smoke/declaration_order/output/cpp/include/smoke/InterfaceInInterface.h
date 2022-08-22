// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <functional>
#include <memory>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT InterfaceInInterface {
public:
    InterfaceInInterface();
    virtual ~InterfaceInInterface() = 0;
public:
    class _GLUECODIUM_CPP_EXPORT FooChecker {
    public:
        FooChecker();
        virtual ~FooChecker() = 0;
    };
    using SomeLambda = ::std::function<void(const ::std::shared_ptr< ::smoke::InterfaceInInterface::FooChecker >&)>;
};
}
