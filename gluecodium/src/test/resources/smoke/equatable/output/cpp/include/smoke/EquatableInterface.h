// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Hash.h"
#include "gluecodium/TypeRepository.h"

namespace smoke {
class _GLUECODIUM_CPP_EXPORT EquatableInterface {
public:
    EquatableInterface();
    virtual ~EquatableInterface();


public:
    bool operator==( const EquatableInterface& rhs );
    bool operator!=( const EquatableInterface& rhs );
};


}

namespace gluecodium {
template<>
struct hash< ::smoke::EquatableInterface > {
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const ::smoke::EquatableInterface& t ) const;
};
/**
 * Specialization of the hash-like function object for `std::shared_ptr`, comparing the contained
 * class instead of the pointer value.
 */
template <>
struct EqualityHash< std::shared_ptr< ::smoke::EquatableInterface > >
{
    _GLUECODIUM_CPP_EXPORT std::size_t operator( )( const std::shared_ptr< ::smoke::EquatableInterface >& t ) const;
};
}
