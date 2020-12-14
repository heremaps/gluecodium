// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "smoke/Comments.h"
#include <string>
#include <system_error>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT UnicodeComments {
public:
    UnicodeComments();
    virtual ~UnicodeComments() = 0;
public:
    /**
     * Süßölgefäß
     * \param[in] input שלום
     * \return товарищ
     * \retval ::smoke::Comments::SomeEnum ネコ
     */
    virtual ::gluecodium::Return< ::smoke::Comments::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input ) = 0;
};
}