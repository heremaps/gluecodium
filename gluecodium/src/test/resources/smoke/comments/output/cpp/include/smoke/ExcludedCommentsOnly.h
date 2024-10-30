// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <functional>
#include <string>
#include <system_error>

namespace smoke {
/**
 * \private

 */
class _GLUECODIUM_CPP_EXPORT ExcludedCommentsOnly {
public:
    ExcludedCommentsOnly();
    virtual ~ExcludedCommentsOnly();


public:
    /**
     * \private

     */
    enum class _GLUECODIUM_CPP_EXPORT SomeEnum {
        /**
         * \private

         */
        USELESS
    };


    /**

     * \private

     */
    using SomeLambda = ::std::function<double(const ::std::string&, const int32_t)>;

    /**
     * \private

     */
    using Usefulness = bool;

    /**
     * \private

     */
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        /**
         * \private

         */
        ::smoke::ExcludedCommentsOnly::Usefulness some_field;

        SomeStruct( );
        explicit SomeStruct( ::smoke::ExcludedCommentsOnly::Usefulness some_field );

    };

    /**
     * \private

     */
    static const ::smoke::ExcludedCommentsOnly::Usefulness VERY_USEFUL;

public:
    /**
     *
     * \private
     * \param[in] input_parameter
     * \return
     * \retval ::smoke::ExcludedCommentsOnly::SomeEnum
     */
    virtual ::gluecodium::Return< ::smoke::ExcludedCommentsOnly::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input_parameter ) = 0;
    /**
     *
     * \private
     */
    virtual void some_method_without_return_type_or_input_parameters(  ) = 0;
    /**
     *
     * \private
     * \return
     */
    virtual ::smoke::ExcludedCommentsOnly::Usefulness is_some_property(  ) const = 0;
    /**
     *
     * \private
     * \param[in] value
     */
    virtual void set_some_property( const ::smoke::ExcludedCommentsOnly::Usefulness value ) = 0;

};


_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::ExcludedCommentsOnly::SomeEnum value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::ExcludedCommentsOnly::SomeEnum > : public std::true_type { };
}
