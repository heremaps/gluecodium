// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
//
// Automatically generated. Do not modify. Your changes will be lost.
//
// -------------------------------------------------------------------------------------------------
#pragma once

#include <string>
#include <unordered_map>
#include <vector>

namespace smoke {
/**
 * This is some very useful interface.
 */
class Comments {
public:
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
 * This is some very useful array.
 */
using SomeArray = ::std::vector< ::std::string >;
/**
 * This is some very useful map.
 */
using SomeMap = ::std::unordered_map< ::std::string, ::smoke::Comments::Usefulness >;
/**
 * This is some very useful struct.
 */
struct SomeStruct {
    /**
     * How useful this struct is
     */
    ::smoke::Comments::Usefulness some_field;
    SomeStruct( );
    SomeStruct( const ::smoke::Comments::Usefulness some_field );
};
/**
 * This is some very useful constant.
 */
static const ::smoke::Comments::Usefulness VERY_USEFUL;

public:
/**
 * This is some very useful method that measures the usefulness of its input.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 */
virtual ::smoke::Comments::Usefulness some_method_with_all_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that measures the usefulness of its input.
 * \param[in] input Very useful input parameter
 */
virtual ::smoke::Comments::Usefulness some_method_with_input_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that measures the usefulness of its input.
 * \return Usefulness of the input
 */
virtual ::smoke::Comments::Usefulness some_method_with_output_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that measures the usefulness of its input.
 */
virtual ::smoke::Comments::Usefulness some_method_with_no_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that does not measure the usefulness of its input.
 * \param[in] input Very useful input parameter
 */
virtual void some_method_without_return_type_with_all_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that does not measure the usefulness of its input.
 */
virtual void some_method_without_return_type_with_no_comments( const ::std::string& input ) = 0;
/**
 * This is some very useful method that measures the usefulness of something.
 * \return Usefulness of the input
 */
virtual ::smoke::Comments::Usefulness some_method_without_input_parameters_with_all_comments(  ) = 0;
/**
 * This is some very useful method that measures the usefulness of something.
 */
virtual ::smoke::Comments::Usefulness some_method_without_input_parameters_with_no_comments(  ) = 0;
virtual void some_method_with_nothing(  ) = 0;
/**
 * This is some very useful method that does nothing.
 */
virtual void some_method_without_return_type_or_input_parameters(  ) = 0;
/**
 * This is some very useful attribute.
 */
virtual ::smoke::Comments::Usefulness is_some_attribute(  ) const = 0;
/**
 * This is some very useful attribute.
 */
virtual void set_some_attribute( const ::smoke::Comments::Usefulness value ) = 0;
};
}