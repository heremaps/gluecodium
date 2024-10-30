// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <string>
#include <system_error>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT PlatformComments {
public:
    PlatformComments();
    virtual ~PlatformComments();


public:
    /**
     * An error code when something goes wrong.

     */
    enum class _GLUECODIUM_CPP_EXPORT SomeEnum {
        USELESS,
        USEFUL
    };


    /**
     * This is a very useful struct.

     */
    struct _GLUECODIUM_CPP_EXPORT Something {
        ::std::string nothing;

        Something( );
        explicit Something( ::std::string nothing );

    };

public:
    /**
     * This is some very useless method that does nothing.
     */
    virtual void do_nothing(  ) = 0;
    /**
     * Cooks very special C++ sauce.
     */
    virtual void do_magic(  ) = 0;
    /**
     * This is some very useful method that measures the usefulness of its input or \esc@pe{s}.
     * \param[in] input Very useful input ::smoke::PlatformComments parameter that \[\esc@pe{s}\]
     * \return Usefulness of the input
     * \retval ::smoke::PlatformComments::SomeEnum Sometimes it happens.
     */
    virtual ::gluecodium::Return< bool, ::std::error_code > some_method_with_all_comments( const ::std::string& input ) = 0;
    /**
     *
     * \deprecated A very useful method that is deprecated.
     */
    virtual void some_deprecated_method(  ) = 0;
};


_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::PlatformComments::SomeEnum value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::PlatformComments::SomeEnum > : public std::true_type { };
}
