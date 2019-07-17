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
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
/**
 * This is some very useful interface.
 * \deprecated Unfortunately, this interface is deprecated. Use ::smoke::Comments instead.
 */
class _GENIUM_CPP_EXPORT DeprecationComments {
public:
    virtual ~DeprecationComments() = 0;
public:
/**
 * This is some very useful enum.
 * \deprecated Unfortunately, this enum is deprecated. Use ::smoke::Comments::SomeEnum instead.
 */
enum class SomeEnum {
    /**
     * Not quite useful
     * \deprecated Unfortunately, this item is deprecated.
     * Use ::smoke::Comments::SomeEnum::USELESS instead.
     */
    USELESS
};
/**
 * This is some very useful typedef.
 * \deprecated Unfortunately, this typedef is deprecated. Use ::smoke::Comments::Usefulness instead.
 */
using Usefulness = bool;
/**
 * This is some very useful array.
 * \deprecated Unfortunately, this array is deprecated. Use ::smoke::Comments::SomeArray instead.
 */
using SomeArray = ::std::vector< ::std::string >;
/**
 * This is some very useful map.
 * \deprecated Unfortunately, this map is deprecated. Use ::smoke::Comments::SomeMap instead.
 */
using SomeMap = ::std::unordered_map< ::std::string, ::smoke::DeprecationComments::Usefulness >;
/**
 * This is some very useful struct.
 * \deprecated Unfortunately, this struct is deprecated. Use ::smoke::Comments::SomeStruct instead.
 */
struct _GENIUM_CPP_EXPORT SomeStruct {
    /**
     * How useful this struct is.
     * \deprecated Unfortunately, this field is deprecated.
     * Use ::smoke::Comments::SomeStruct::some_field instead.
     */
    ::smoke::DeprecationComments::Usefulness some_field;
    SomeStruct( );
    SomeStruct( const ::smoke::DeprecationComments::Usefulness some_field );
};
/**
 * This is some very useful constant.
 * \deprecated Unfortunately, this constant is deprecated. Use ::smoke::Comments::VERY_USEFUL instead.
 */
_GENIUM_CPP_EXPORT static const ::smoke::DeprecationComments::Usefulness VERY_USEFUL;
public:
/**
 * This is some very useful method that measures the usefulness of its input.
 * \deprecated Unfortunately, this method is deprecated.
 * Use ::smoke::Comments::some_method_with_all_comments instead.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 */
virtual ::smoke::DeprecationComments::Usefulness some_method_with_all_comments( const ::std::string& input ) = 0;
/**
 * Gets some very useful attribute.
 * \deprecated Unfortunately, this attribute is deprecated.
 * Use ::smoke::Comments::is_some_attribute instead.
 */
virtual ::smoke::DeprecationComments::Usefulness is_some_attribute(  ) const = 0;
/**
 * Sets some very useful attribute.
 * \deprecated Unfortunately, this attribute is deprecated.
 * Use ::smoke::Comments::is_some_attribute instead.
 */
virtual void set_some_attribute( const ::smoke::DeprecationComments::Usefulness value ) = 0;
};
}