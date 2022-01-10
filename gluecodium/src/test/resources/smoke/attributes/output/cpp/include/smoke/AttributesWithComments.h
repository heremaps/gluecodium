// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>
namespace smoke {
/**
 * Class comment
 */
class _GLUECODIUM_CPP_EXPORT [[OnClass]] AttributesWithComments {
public:
    AttributesWithComments();
    virtual ~AttributesWithComments() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT SomeStruct {
        /**
         * Field comment
         */
        [[OnField]]
        ::std::string field;
        SomeStruct( );
        explicit SomeStruct( ::std::string field );
    };
    /**
     * Const comment
     */
    [[OnConstInClass]]
    _GLUECODIUM_CPP_EXPORT static const bool PI;
public:
    /**
     * Function comment
     */
    [[OnFunctionInClass]]
    virtual void very_fun(  ) = 0;
    /**
     * Getter comment
     * \return Property comment
     */
    [[OnPropertyInClass]]
    virtual ::std::string get_prop(  ) const = 0;
    /**
     * Setter comment
     * \param[in] value Property comment
     */
    [[OnPropertyInClass]]
    virtual void set_prop( const ::std::string& value ) = 0;
};
}
