// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include "gluecodium/TypeRepository.h"
#include <cstdint>
#include <string>
namespace smoke {
/**
 * \deprecated Unfortunately, this interface is deprecated.
 */
class _GLUECODIUM_CPP_EXPORT DeprecationCommentsOnly {
public:
    DeprecationCommentsOnly();
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
     * \deprecated Unfortunately, this struct is deprecated.
     */
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        /**
         * \deprecated Unfortunately, this field is deprecated.
         */
        ::smoke::DeprecationCommentsOnly::Usefulness some_field;
        SomeStruct( );
        SomeStruct( ::smoke::DeprecationCommentsOnly::Usefulness some_field );
    };
    /**
     * \deprecated Unfortunately, this constant is deprecated.
     */
    _GLUECODIUM_CPP_EXPORT static const ::smoke::DeprecationCommentsOnly::Usefulness VERY_USEFUL;
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
     * \deprecated Unfortunately, this property's getter is deprecated.
     * \return
     */
    virtual ::smoke::DeprecationCommentsOnly::Usefulness is_some_property(  ) const = 0;
    /**
     *
     * \deprecated Unfortunately, this property's setter is deprecated.
     * \param[in] value
     */
    virtual void set_some_property( const ::smoke::DeprecationCommentsOnly::Usefulness value ) = 0;
};
}
namespace gluecodium {
_GLUECODIUM_CPP_EXPORT TypeRepository& get_type_repository(const ::smoke::DeprecationCommentsOnly*);
}
