// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <functional>
#include <optional>
#include <string>
#include <system_error>

namespace smoke {
/**
 * This is some very useful interface.

 */
class _GLUECODIUM_CPP_EXPORT Comments {
public:
    Comments();
    virtual ~Comments();


public:
    /**
     * This is some very useful enum.

     */
    enum class SomeEnum {
        /**
         * Not quite useful

         */
        USELESS,
        /**
         * Somewhat useful

         */
        USEFUL
    };


    /**
     * This is some very useful lambda that does it.
     * \param[in] p0 Very useful input parameter
     * \param[in] p1 Slightly less useful input parameter
     * \return Usefulness of the input
     */
    using SomeLambda = ::std::function<double(const ::std::string&, const int32_t)>;

    /**
     * This is some very useful typedef.

     */
    using Usefulness = bool;

    /**
     * This is some very useful struct.

     */
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        /**
         * How useful this struct is
         * remains to be seen

         */
        ::smoke::Comments::Usefulness some_field;
        /**
         * Can be `null`

         */
        std::optional< ::std::string > nullable_field = std::optional< ::std::string >();

        /**
         * This is how easy it is to construct.
         */
        SomeStruct( );
        /**
         * This is how easy it is to construct.

         * \param some_field How useful this struct is
         * remains to be seen

         */
        explicit SomeStruct( ::smoke::Comments::Usefulness some_field );
        /**
         * This is how easy it is to construct.

         * \param some_field How useful this struct is
         * remains to be seen


         * \param nullable_field Can be `null`

         */
        SomeStruct( ::smoke::Comments::Usefulness some_field, std::optional< ::std::string > nullable_field );

        /**
         * This is some struct method that does nothing.
         */
        void some_struct_method(  ) const;
        /**
         * This is some static struct method that does nothing.
         */
        static void some_static_struct_method(  );

    };

    /**
     * This is some very useful constant.

     */
    static const ::smoke::Comments::Usefulness VERY_USEFUL;

public:
    /**
     * This is some very useful method that measures the usefulness of its input.
     * \param[in] input_parameter Very useful input parameter
     * \return Usefulness of the input
     * \retval ::smoke::Comments::SomeEnum Sometimes it happens.
     */
    virtual ::gluecodium::Return< ::smoke::Comments::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input_parameter ) = 0;
    /**
     * This is some very useful method that measures the usefulness of its input.
     * \param[in] input Very useful input parameter
     * \return
     */
    virtual ::smoke::Comments::Usefulness some_method_with_input_comments( const ::std::string& input ) = 0;
    /**
     * This is some very useful method that measures the usefulness of its input.
     * \param[in] input
     * \return Usefulness of the input
     */
    virtual ::smoke::Comments::Usefulness some_method_with_output_comments( const ::std::string& input ) = 0;
    /**
     * This is some very useful method that measures the usefulness of its input.
     * \param[in] input
     * \return
     */
    virtual ::smoke::Comments::Usefulness some_method_with_no_comments( const ::std::string& input ) = 0;
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * \param[in] input Very useful input parameter
     */
    virtual void some_method_without_return_type_with_all_comments( const ::std::string& input ) = 0;
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * \param[in] input
     */
    virtual void some_method_without_return_type_with_no_comments( const ::std::string& input ) = 0;
    /**
     * This is some very useful method that measures the usefulness of something.
     * \return Usefulness of the input
     */
    virtual ::smoke::Comments::Usefulness some_method_without_input_parameters_with_all_comments(  ) = 0;
    /**
     * This is some very useful method that measures the usefulness of something.
     * \return
     */
    virtual ::smoke::Comments::Usefulness some_method_without_input_parameters_with_no_comments(  ) = 0;
    virtual void some_method_with_nothing(  ) = 0;
    /**
     * This is some very useful method that does nothing.
     */
    virtual void some_method_without_return_type_or_input_parameters(  ) = 0;
    /**
     *
     * \param[in] undocumented
     * \param[in] documented nicely documented
     * \return
     */
    virtual ::std::string one_parameter_comment_only( const ::std::string& undocumented, const ::std::string& documented ) = 0;
    /**
     *
     * \param[in] undocumented
     * \return nicely documented
     */
    virtual ::std::string return_comment_only( const ::std::string& undocumented ) = 0;
    /**
     * Gets some very useful property.
     * Note: without these comments user may not be able to use it correctly.
     * Note: that's serious.
     * Therefore, these lines above getter/setter need to be rendered in the output files.
     * \return Some very useful property.
     */
    virtual ::smoke::Comments::Usefulness is_some_property(  ) const = 0;
    /**
     * Sets some very useful property.
     * Note: without these comments user may not be able to use it correctly.
     * Note: that's serious.
     * Therefore, these lines above getter/setter need to be rendered in the output files.
     * \param[in] value Some very useful property.
     */
    virtual void set_some_property( const ::smoke::Comments::Usefulness value ) = 0;

    /**
     * Gets OnlyGetterProperty in a very specific way.
     * The generated documentation for this property should only be added to property or getter.
     * \return OnlyGetterProperty, which does not have a setter.
     */
    virtual int32_t get_only_getter_property(  ) const = 0;

    /**
     * Returns 'true' if ::smoke::Comments::get_only_getter_property should be visible on the screen. Else returns false.
     * This getter also may have additional info that is added to its comment. It can be described here.
     * By default it is set to `false`. In this case the mentioned thing is not visible on the
     * screen except the case when another flag called ::smoke::Comments::is_some_property forces it.
     * When set to `true` then it is always visible.
     *
     * The additional information about usage of the visibility flag is described here. It contains a lot
     * of references. For instance, if ::smoke::Comments::is_some_property is `nullptr`
     * then it is not visible even if flag is set to `true`.
     * \return A flag that determines if ::smoke::Comments::get_only_getter_property is visible on the screen.
     */
    virtual bool is_is_visible(  ) const = 0;
    /**
     * Sets the visibility flag that controls if ::smoke::Comments::get_only_getter_property should be visible on the screen.
     * By default it is set to `false`. In this case the mentioned thing is not visible on the
     * screen except the case when another flag called ::smoke::Comments::is_some_property forces it.
     * When set to `true` then it is always visible.
     *
     * The additional information about usage of the visibility flag is described here. It contains a lot
     * of references. For instance, if ::smoke::Comments::is_some_property is `nullptr`
     * then it is not visible even if flag is set to `true`.
     * \param[in] value A flag that determines if ::smoke::Comments::get_only_getter_property is visible on the screen.
     */
    virtual void set_is_visible( const bool value ) = 0;

};


_GLUECODIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Comments::SomeEnum value ) noexcept;
}

namespace std
{
template <>
struct is_error_code_enum< ::smoke::Comments::SomeEnum > : public std::true_type { };
}
