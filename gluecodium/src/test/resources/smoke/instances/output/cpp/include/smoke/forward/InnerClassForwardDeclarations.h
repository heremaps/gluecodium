// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/TypeRepository.h"
#include <memory>

namespace smoke {
namespace forward {
class _GLUECODIUM_CPP_EXPORT InnerClassForwardDeclarations {
public:
    InnerClassForwardDeclarations();
    virtual ~InnerClassForwardDeclarations() = 0;

public:
    class InnerClass;
    class InnerInterface;

public:
    class _GLUECODIUM_CPP_EXPORT InnerClass {
    public:
        InnerClass();
        virtual ~InnerClass() = 0;

    public:
        /**
         *
         * \return @NotNull
         */
        virtual ::std::shared_ptr< ::smoke::forward::InnerClassForwardDeclarations::InnerInterface > get_inner_interface(  ) = 0;
    };

    class _GLUECODIUM_CPP_EXPORT InnerInterface {
    public:
        InnerInterface();
        virtual ~InnerInterface() = 0;

    };

};

}
}
