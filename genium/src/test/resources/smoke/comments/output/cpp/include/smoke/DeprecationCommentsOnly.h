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
#include "genium/UnorderedMapHash.h"
#include "genium/VectorHash.h"
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>
namespace smoke {
/**
 * \deprecated Unfortunately, this interface is deprecated.
 */
class _GENIUM_CPP_EXPORT DeprecationCommentsOnly {
public:
    virtual ~DeprecationCommentsOnly() = 0;
public:
/**
 * \deprecated Unfortunately, this enum is deprecated.
 */
enum class SomeEnum {
    USELESS
};
/**
 * \deprecated Unfortunately, this typedef is deprecated.
 */
using Usefulness = bool;
/**
 * \deprecated Unfortunately, this array is deprecated.
 */
using SomeArray = ::std::vector< ::std::string >;
/**
 * \deprecated Unfortunately, this map is deprecated.
 */
using SomeMap = ::std::unordered_map< ::std::string, ::smoke::DeprecationCommentsOnly::Usefulness >;
/**
 * \deprecated Unfortunately, this struct is deprecated.
 */
struct _GENIUM_CPP_EXPORT SomeStruct {
    /**
     * \deprecated Unfortunately, this field is deprecated.
     */
    ::smoke::DeprecationCommentsOnly::Usefulness some_field;
    SomeStruct( );
    SomeStruct( const ::smoke::DeprecationCommentsOnly::Usefulness some_field );
};
/**
 * \deprecated Unfortunately, this constant is deprecated.
 */
_GENIUM_CPP_EXPORT static const ::smoke::DeprecationCommentsOnly::Usefulness VERY_USEFUL;
public:
/**
 *
 * \deprecated Unfortunately, this method is deprecated.
 * \param[in] input Very useful input parameter
 * \return Usefulness of the input
 */
virtual ::smoke::DeprecationCommentsOnly::Usefulness some_method_with_all_comments( const ::std::string& input ) = 0;
/**
 *
 * \deprecated Unfortunately, this attribute is deprecated.
 * \return
 */
virtual ::smoke::DeprecationCommentsOnly::Usefulness is_some_attribute(  ) const = 0;
/**
 *
 * \deprecated Unfortunately, this attribute is deprecated.
 * \param[in] value
 */
virtual void set_some_attribute( const ::smoke::DeprecationCommentsOnly::Usefulness value ) = 0;
};
}
namespace genium {
template<>
struct hash< ::smoke::DeprecationCommentsOnly::SomeEnum > {
    std::size_t operator( )( const ::smoke::DeprecationCommentsOnly::SomeEnum& t ) const;
};
}