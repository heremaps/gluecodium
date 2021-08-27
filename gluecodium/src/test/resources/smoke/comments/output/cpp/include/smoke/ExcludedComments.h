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
 * This is some very useful class.
 * \private
 */
class _GLUECODIUM_CPP_EXPORT ExcludedComments {
public:
    ExcludedComments();
    virtual ~ExcludedComments() = 0;
public:
    /**
     * This is some very useful enum.
     * \private
     */
    enum class SomeEnum {
        /**
         * Not quite useful
         * \private
         */
        USELESS
    };
    /**
     * This is some very useful lambda that does it.
     * \private
     */
    using SomeLambda = ::std::function<double(const ::std::string&, const int32_t)>;
    /**
     * This is some very useful typealias.
     * \private
     */
    using Usefulness = bool;
    /**
     * This is some very useful struct.
     * \private
     */
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        /**
         * How useful this struct is
         * remains to be seen
         * \private
         */
        ::smoke::ExcludedComments::Usefulness some_field;
        /**
         * This is how easy it is to construct.
         */
        SomeStruct( );
        /**
         * This is how easy it is to construct.
         * \param some_field How useful this struct is
         * remains to be seen
         */
        SomeStruct( ::smoke::ExcludedComments::Usefulness some_field );
    };
    /**
     * This is some very useful constant.
     * \private
     */
    _GLUECODIUM_CPP_EXPORT static const ::smoke::ExcludedComments::Usefulness VERY_USEFUL;
public:
    /**
     * This is some very useful method that measures the usefulness of its input.
     * \private
     * \param[in] input_parameter Very useful input parameter
     * \return Usefulness of the input
     * \retval ::smoke::ExcludedComments::SomeEnum Sometimes it happens.
     */
    virtual ::gluecodium::Return< ::smoke::ExcludedComments::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input_parameter ) = 0;
    /**
     * This is some very useful method that does nothing.
     * \private
     */
    virtual void some_method_without_return_type_or_input_parameters(  ) = 0;
    /**
     * Gets some very useful property.
     * \private
     * \return Some very useful property.
     */
    virtual ::smoke::ExcludedComments::Usefulness is_some_property(  ) const = 0;
    /**
     * Sets some very useful property.
     * \private
     * \param[in] value Some very useful property.
     */
    virtual void set_some_property( const ::smoke::ExcludedComments::Usefulness value ) = 0;
};
_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::ExcludedComments::SomeEnum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::ExcludedComments::SomeEnum > : public std::true_type { };
}
