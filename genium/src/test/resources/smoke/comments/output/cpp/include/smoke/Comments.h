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
#include "genium/Hash.h"
#include "genium/Optional.h"
#include "genium/Return.h"
#include "genium/TypeRepository.h"
#include <cstdint>
#include <string>
#include <system_error>
namespace smoke {
/**
 * This is some very useful interface.
 */
class _GENIUM_CPP_EXPORT Comments {
public:
    Comments();
    virtual ~Comments() = 0;
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
 * This is some very useful typedef.
 */
using Usefulness = bool;
/**
 * This is some very useful struct.
 */
struct _GENIUM_CPP_EXPORT SomeStruct {
    /**
     * How useful this struct is
     */
    ::smoke::Comments::Usefulness some_field;
    /**
     * Can be `null`
     */
    ::genium::optional< ::std::string > nullable_field;
    /**
     * This is how easy it is to construct.
     */
    SomeStruct( );
    /**
     * This is how easy it is to construct.
     * @param some_field How useful this struct is
     * @param nullable_field Can be `null`
     */
    SomeStruct( const ::smoke::Comments::Usefulness some_field, const ::genium::optional< ::std::string >& nullable_field );
};
/**
 * This is some very useful constant.
 */
_GENIUM_CPP_EXPORT static const ::smoke::Comments::Usefulness VERY_USEFUL;
public:
/**
 * This is some very useful method that measures the usefulness of its input.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 * \retval ::smoke::Comments::SomeEnum Sometimes it happens.
 */
virtual ::genium::Return< ::smoke::Comments::Usefulness, ::std::error_code > some_method_with_all_comments( const ::std::string& input ) = 0;
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
 * \return Some very useful property.
 */
virtual ::smoke::Comments::Usefulness is_some_property(  ) const = 0;
/**
 * Sets some very useful property.
 * \param[in] value Some very useful property.
 */
virtual void set_some_property( const ::smoke::Comments::Usefulness value ) = 0;
};
_GENIUM_CPP_EXPORT ::std::error_code make_error_code( ::smoke::Comments::SomeEnum value ) noexcept;
}
namespace std
{
template <>
struct is_error_code_enum< ::smoke::Comments::SomeEnum > : public std::true_type { };
}
namespace genium {
template<>
struct hash< ::smoke::Comments::SomeEnum > {
    std::size_t operator( )( const ::smoke::Comments::SomeEnum& t ) const;
};
}
