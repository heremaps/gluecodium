// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <memory>
#include <string>
namespace smoke {
    class NestedReferences;
}
namespace smoke {
class _GLUECODIUM_CPP_EXPORT NestedReferences {
public:
    NestedReferences();
    virtual ~NestedReferences() = 0;
public:
    struct _GLUECODIUM_CPP_EXPORT NestedReferences {
        ::std::string string_field;
        NestedReferences( );
        NestedReferences( const ::std::string& string_field );
    };
public:
    /**
     *
     * \param[in] struct1
     * \param[in] struct2
     * \return @NotNull
     */
    virtual ::std::shared_ptr< ::smoke::NestedReferences > inside_out( const ::smoke::NestedReferences::NestedReferences& struct1, const ::smoke::NestedReferences::NestedReferences& struct2 ) = 0;
};
}
