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

namespace examples {
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
using SomeMap = ::std::unordered_map< ::std::string, ::examples::Comments::Usefulness >;
/**
 * This is some very useful struct.
 */
struct SomeStruct {
    /**
     * How useful this struct is
     */
    ::examples::Comments::Usefulness some_field;
};
/**
 * This is some very useful constant.
 */
static const ::examples::Comments::Usefulness VERY_USEFUL;

public:
/**
 * This is some very useful method that measures the usefulness of its input.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 */
virtual ::examples::Comments::Usefulness some_method( const ::std::string& input ) = 0;
/**
 * This is some very useful attribute.
 */
virtual ::examples::Comments::Usefulness is_some_attribute(  ) = 0;
/**
 * This is some very useful attribute.
 */
virtual void set_some_attribute( const ::examples::Comments::Usefulness value ) = 0;
};
}