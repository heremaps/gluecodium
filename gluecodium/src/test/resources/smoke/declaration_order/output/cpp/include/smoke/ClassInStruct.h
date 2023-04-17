// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>
#include <memory>
namespace smoke {
struct _GLUECODIUM_CPP_EXPORT ClassInStruct {
    class _GLUECODIUM_CPP_EXPORT FooChecker {
    public:
        FooChecker();
        virtual ~FooChecker() = 0;
    };
    using SomeLambda = ::std::function<void(const ::std::shared_ptr< ::smoke::ClassInStruct::FooChecker >&)>;
};
}
