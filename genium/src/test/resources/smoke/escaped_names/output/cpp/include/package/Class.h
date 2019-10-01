// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/Return.h"
#include "package/Interface.h"
#include "package/Types.h"
#include <memory>
#include <system_error>
namespace package {
    class Class;
}
namespace package {
class _GLUECODIUM_CPP_EXPORT Class: public ::package::Interface {
public:
    Class();
    virtual ~Class() = 0;
public:
    /**
     *
     * \return @NotNull
     */
    static ::std::shared_ptr< ::package::Class > constructor(  );
    virtual ::gluecodium::Return< ::package::Struct, ::std::error_code > fun( const ::package::List& double ) = 0;
    virtual ::package::Enum get_property(  ) const = 0;
    virtual void set_property( const ::package::Enum value ) = 0;
};
}