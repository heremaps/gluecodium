// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include "smoke/SimpleClass.h"
#include "smoke/SimpleInterface.h"
#include "smoke/forward/Class1.h"
#include "smoke/forward/Class2.h"
#include <memory>
namespace smoke {
    class SimpleClass;
    class SimpleInterface;
namespace forward {
    class Class1;
    class Class2;
}
}
namespace smoke {
namespace forward {
class _GLUECODIUM_CPP_EXPORT UseForward {
public:
    UseForward();
    virtual ~UseForward() = 0;
public:
    /**
     *
     * \param[in] param1 @NotNull
     * \param[in] param2 @NotNull
     * \param[in] simple_class @NotNull
     * \param[in] simple_interface @NotNull
     */
    virtual void use_it( const ::std::shared_ptr< ::smoke::forward::Class1 >& param1, const ::std::shared_ptr< ::smoke::forward::Class2 >& param2, const ::std::shared_ptr< ::smoke::SimpleClass >& simple_class, const ::std::shared_ptr< ::smoke::SimpleInterface >& simple_interface ) = 0;
};
}
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::forward::UseForward*);
}
