// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "genium/Export.h"
#include "genium/Return.h"
#include "genium/TypeRepository.h"
#include "package/Interface.h"
#include "package/Types.h"
#include <memory>
#include <system_error>
namespace package {
    class Class;
}
namespace package {
class _GENIUM_CPP_EXPORT Class: public ::package::Interface {
public:
    Class();
    virtual ~Class() = 0;
public:
/**
 *
 * \return @NotNull
 */
static ::std::shared_ptr< ::package::Class > constructor(  );
virtual ::genium::Return< ::package::Struct, ::std::error_code > fun( const ::package::List& double ) = 0;
virtual ::package::Enum get_property(  ) const = 0;
virtual void set_property( const ::package::Enum value ) = 0;
};
}
namespace genium {
_GENIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::package::Class*);
}