// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "package/Interface.h"
#include "package/Types.h"
#include <memory>
#include <system_error>

namespace package {
class _GLUECODIUM_CPP_EXPORT Class: public ::package::Interface {
public:
    Class();
    virtual ~Class();


public:
    /**
     *
     * \return @NotNull
     */
    static ::std::shared_ptr< ::package::Class > constructor(  );
    virtual ::gluecodium::Return< ::package::Types::Struct, ::std::error_code > fun( const ::package::Types::ULong& double ) = 0;
    virtual ::package::Types::Enum get_property(  ) const = 0;
    virtual void set_property( const ::package::Types::Enum value ) = 0;

};


}
