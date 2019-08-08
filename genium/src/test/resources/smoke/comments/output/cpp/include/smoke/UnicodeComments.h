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
#include "smoke/Comments.h"
#include <string>
#include <system_error>
namespace smoke {
class _GENIUM_CPP_EXPORT UnicodeComments {
public:
    virtual ~UnicodeComments() = 0;
public:
/**
 * Süßölgefäß
 * \param[in] input שלום
 * \return товарищ
 * \retval ::smoke::Comments::SomeEnum ネコ
 */
virtual ::genium::Return< ::smoke::Comments::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input ) = 0;
};
}
